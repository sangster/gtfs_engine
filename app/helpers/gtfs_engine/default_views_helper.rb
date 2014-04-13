module GtfsEngine
  module DefaultViewsHelper
    def index(json, records)
      json.ignore_nil! true
      json.cache! "#{controller_name}_index" do
        json.array! records do |record|
          json.extract! record, *fields
        end
      end
    end

    def show(json, record)
      json.ignore_nil! true
      json.cache! record do
        json.extract! record, *fields
      end
    end
  end
end
