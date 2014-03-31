require 'set'
require 'activerecord-import'

module GtfsEngine
  class Sources < ::BasicObject
    def initialize(config)
      @config = config
      @source_ids = ::Set.new
    end

    def method_missing(name, &block)
      source = @config.sources.__send__ name
      add_default_importers source
      source.tap { |s| s.instance_exec s, &block if ::Kernel.block_given? }
    end

    private

    def add_default_importers(source)
      id = source.__id__
      return if @source_ids.include? id
      @source_ids.add id

      method = ::Kernel.instance_method(:method).bind self
      bulk_importer = method.call :bulk_importer
      set_id = ::OpenStruct.new id: -1

      source.before do |etag|
        if DataSet.where(name: source.name, etag: etag).count != 0
          ::Kernel.raise ::GtfsReader::SkipSourceError,
                "Data Pull already exists for #{etag}"
        else
          set = DataSet.create name: source.name, etag: etag, url: source.url
          set.reload
          set_id.id = set.id
        end
      end

      source.handlers bulk_importer, set_id, bulk: 1024 do |importer, set_id|
        stops          &importer.call( Stop, set_id )
        shapes         &importer.call( Shape, set_id )
        routes         &importer.call( Route, set_id )
        calendar       &importer.call( Calendar, set_id )
        calendar_dates &importer.call( CalendarDate, set_id )
        trips          &importer.call( Trip, set_id )
        stop_times     &importer.call( StopTime, set_id )
      end
    end

    def bulk_importer(model_class, data_set_id_holder)
      ::Proc.new do
        before do
          ::Rails.logger.info "Deleting all rows from #{model_class}"
          model_class.delete_all
        end

        read {|row| model_class.new row }

        bulk do |models, count, total|
          id = data_set_id_holder.id
          models.each {|m| m.data_set_id = id }

          model_class.import models
          ::Rails.logger.info "Inserted #{count} #{model_class} records
(total: #{total})"
        end
      end
    end
  end
end
