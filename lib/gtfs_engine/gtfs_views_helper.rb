module GtfsEngine
  module GtfsViewsHelper
    def index(json, records)
      filter = try :filter || {}
      json.cache! [controller_name, filter] do
        json.ignore_nil! true

        json.status 'success'
        json.data do
          json.set! controller_name do
            json.array!(records) {|record| json.extract! record, *fields }
          end
        end
      end
    end

    def show(json, record)
      json.cache! record do
        json.ignore_nil! true
        json.status 'success'
        json.data do
          json.set! controller_name.singularize do
            json.extract! record, *fields
          end
        end
      end
    end
  end
end
