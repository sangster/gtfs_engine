module GtfsEngine::Concerns::Controllers::Gtfs
  extend ActiveSupport::Concern

  included do
    around_filter :gtfs_cache, only: [:index, :show]

    def self.gtfs_id(id=nil)
      @gtfs_id = id unless id.nil?
      @gtfs_id
    end

    def index
      @records = collection
      respond_with @records, template: 'gtfs_engine/gtfs/index'
    end

    def show
      @record = record
      respond_with @record, template: 'gtfs_engine/gtfs/show'
    end

    protected

    #@return [ActiveRecord::Relation] all the records in this GTFS association
    def collection
      data.send controller_name
    end

    #@return [ActiveRecord::Base] the record identified by +params[:id]+ in this
    #  GTFS association
    def record
      collection.find_by gtfs_id => params[:id]
    end

    #@return [Symbol] the unique key for this GTFS association
    def gtfs_id
      self.class.gtfs_id or controller_name.foreign_key
    end

    private

    def gtfs_cache
      options = {
        etag: [controller_name, data],
        last_modified: data.updated_at
      }
      yield if stale? options
    end
  end
end
