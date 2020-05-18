# frozen_string_literal: true

module GtfsEngine
  module FieldsHelper
    def fields
      (@fields ||= {})[model] ||= create_fields
    end

    private

    def model
      @model ||= controller_name.classify
    end

    def create_fields
      attributes = GtfsEngine.const_get(model).attribute_names
      attributes - %w[id data_set_id]
    end
  end
end
