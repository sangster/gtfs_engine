module GtfsEngine
  module ApplicationHelper
    def fields
      (@fields ||= {})[model] ||= create_fields
    end

    private

    def model
      @model ||= controller_name.classify
    end

    def create_fields
      send_aliases = GtfsEngine.send_aliased_keys
      unprefixed + (send_aliases ? aliases.keys : aliases.values)
    end

    def unprefixed
      model_class.unprefixed_attributes
    end

    def aliases
      model_class.aliases
    end

    def model_class
      @class ||= "#{controller.class.name.deconstantize}::#{model}".constantize
    end
  end
end
