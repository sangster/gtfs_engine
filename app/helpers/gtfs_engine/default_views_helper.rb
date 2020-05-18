# frozen_string_literal: true

module GtfsEngine
  module DefaultViewsHelper
    def index(json, records)
      json.cache!([controller_name, filter]) do
        json.ignore_nil!(true)
        json.array!(records) { |record| json.extract!(record, *fields) }
      end
    end

    def show(json, record)
      json.cache!(record) do
        json.ignore_nil!(true)
        json.extract!(record, *fields)
      end
    end
  end
end
