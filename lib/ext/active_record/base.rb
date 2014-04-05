module ActiveRecord
  class << Base
    def aliases
      @aliases ||= {}
    end

    def prefix_aliases(prefix, *aliases)
      aliases.each do |al|
        self.aliases[al] = "#{prefix}_#{al}"
        alias_attribute al, self.aliases[al]
      end
    end

    def unprefixed_attributes
      attribute_names - aliases.values - %w(id data_set_id)
    end
  end
end
