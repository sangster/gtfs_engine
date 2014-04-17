module GtfsEngine::Concerns::Controllers::Gtfs
  extend ActiveSupport::Concern

  included do
    around_filter :gtfs_cache, only: [:index, :show]

    rescue_from GtfsEngine::UnknownFilter, with: :unknown_filter
    rescue_from ActiveRecord::StatementInvalid, with: :statement_invalid
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    #@return [Symbol] the unique key for this GTFS association
    def self.gtfs_id(id=nil)
      @gtfs_id = id unless id.nil?
      @gtfs_id or controller_name.singularize.foreign_key
    end

    def self.filters(*attrs)
      attrs.flatten!
      @filters = unalias attrs unless attrs.empty?
      @filters ||= []
    end

    #@return [Class] the +ActiveRecord::Base+ class associated with this
    #  controller
    def self.record_class
      @record_class ||= begin
        "#{name.deconstantize}::#{controller_name.classify}".constantize
      end
    end

    def self.unalias(attrs)
      aliases = record_class.aliases
      case attrs
      when Hash
        attrs.each_with_object({}) do |(k,v), hash|
          hash[(aliases[k] or k).to_s] = v.to_s
        end
      else
        attrs.map {|at| (aliases[at] or at).to_s }
      end
    end

    def index
      @records = query.empty? ? collection : filtered_collection
      respond_with @records, template: 'gtfs_engine/gtfs/index'
    end

    def show
      @record = record
      respond_with @record, template: 'gtfs_engine/gtfs/show'
    end

    def filter
      @filter ||= begin
        query = self.class.unalias self.query
        unknown = query.map do |q, v|
          query[q] = true if v.blank? # blank value indicates boolean filter
          filters.include?(q) ? nil : q
        end.compact

        unless unknown.empty?
          raise GtfsEngine::UnknownFilter.new(unknown), 'unknown filter'
        end
        query_params = ActionController::Parameters.new query
        query_params.permit filters
      end
    end
    helper_method :filter

    protected

    #@return [ActiveRecord::Relation] all the records in this GTFS association
    def collection
      data.send controller_name
    end

    #@return [ActiveRecord::Relation] all the records in this GTFS
    #  association that match the filter specified in the query string
    def filtered_collection
      collection.where filter
    end

    #@return [ActiveRecord::Base] the record identified by +params[:id]+ in this
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
        last_modified: data.updated_at
      }
      yield if stale? options
    end

    #@param ex [GtfsEngine::UnknownFilter]
    def unknown_filter(ex)
      json = {status: 'fail', data: ex.to_hash}
      render status: :bad_request, format => json
    end

    def statement_invalid(ex)
      inner = ex.original_exception
      case inner
      when PG::InvalidDatetimeFormat, PG::DatetimeFieldOverflow
        lines = inner.message.split "\n"
        /.*"([^"]+)"[^"]+/ === lines[1][0..lines[2].size] and begin
          json = {status: 'fail', data: {$1 => 'invalid date'}}
          render status: :bad_request, format => json
        end
      else
        raise ex
      end
    end

    def record_not_found(ex)
      json = {status: 'fail', data: {gtfs_id => params[:id]}}
      render status: :not_found, format => json
    end
  end
end
