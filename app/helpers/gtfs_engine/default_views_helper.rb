module GtfsEngine
  module DefaultViewsHelper
    def index(json, records)
      json.cache! [controller_name, filter] do
        json.ignore_nil! true

        json.status 'success'
        json.data do
          json.array!(records) {|record| json.extract! record, *fields }
        end
      end
    end

    def show(json, record)
      json.cache! record do
        json.ignore_nil! true
        json.status 'success'
        json.data { json.extract! record, *fields }
      end
    end
  end
end
