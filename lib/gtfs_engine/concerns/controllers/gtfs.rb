# frozen_string_literal: true

module GtfsEngine::Concerns::Controllers::Gtfs
  extend ActiveSupport::Concern

  included do
    around_action :gtfs_cache, only: %i[index show]

    rescue_from GtfsEngine::UnknownFilters,     with: :unknown_filter
    rescue_from ActiveRecord::StatementInvalid, with: :statement_invalid
    rescue_from ActiveRecord::RecordNotFound,   with: :record_not_found
    helper_method :filter
  end

  module ClassMethods
    # @return [Symbol] the unique key for this GTFS association
    def gtfs_id(id = nil)
      @gtfs_id = id unless id.nil?
      @gtfs_id || controller_name.singularize.foreign_key
    end

    def filters(*attrs)
      attrs.flatten!
      @filters = attrs unless attrs.empty?
      @filters ||= []
    end

    # @return [Class] the +ActiveRecord::Base+ class associated with this
    #  controller
    def record_class
      @record_class ||= begin
        "#{name.deconstantize}::#{controller_name.classify}".constantize
      end
    end
  end

  # GET / collection of elements for the given GTFS type
  # The returned collection may be filtered with query parameters
  def index
    @records = query.empty? ? collection : filtered_collection
    respond_with @records, template: 'gtfs_engine/gtfs/index'
  end

  # GET /:id for a specific element of the given GTFS type
  def show
    @record = record
    respond_with @record, template: 'gtfs_engine/gtfs/show'
  end

  # @return <ActionController::Parameters> the map of fields to filter;
  # derived from the query string
  def filter
    @filter ||= begin
      query = self.query
      unknown = query.map do |q, v|
        query[q] = true if v.blank? # blank value indicates boolean filter
        filters.include?(q.to_sym) ? nil : q
      end.compact

      unless unknown.empty?
        raise GtfsEngine::UnknownFilters.new(unknown), 'unknown filter'
      end

      query_params = ActionController::Parameters.new query
      query_params.permit filters
    end
  end

  protected

  # @return [ActiveRecord::Relation] all the records in this GTFS association
  def collection
    data.send controller_name
  end

  # @return [ActiveRecord::Relation] all the records in this GTFS
  #  association that match the filter specified in the query string
  def filtered_collection
    collection.where filter
  end

  # @return [ActiveRecord::Base] the record identified by +params[:id]+ in this
  #  GTFS association
  def record
    collection.find_by! gtfs_id => params[:id]
  end

  def gtfs_id
    self.class.gtfs_id
  end

  def filters
    self.class.filters
  end

  def query
    request.query_parameters
  end

  private

  def format
    request.format.to_sym
  end

  def gtfs_cache
    options = {
      etag: [controller_name, data, query],
      last_modified: data.updated_at,
      public: true
    }

    expires_in 3.hours
    yield if stale? options
  end

  # @param ex [GtfsEngine::UnknownFilter]
  def unknown_filter(ex)
    render status: :bad_request, jsend: {
      error: 'unknown filter', data: ex.to_h
    }
  end

  def statement_invalid(ex)
    inner = ex.original_exception
    case inner
    when PG::InvalidDatetimeFormat, PG::DatetimeFieldOverflow
      lines = inner.message.split "\n"
      (/.*"([^"]+)"[^"]+/ === lines[1][0..lines[2].size]) && begin
        render status: :bad_request, jsend: {
          message: 'invalid date', data: { Regexp.last_match(1) => 'invalid date' }
        }
      end
    else
      raise ex
    end
  end

  def record_not_found(_ex)
    render status: :not_found, jsend: {
      error: 'record not found', data: { gtfs_id => params[:id] }
    }
  end
end
