module ActiveRecord
  class << Base
    def aliases
      @aliases ||= ActiveSupport::HashWithIndifferentAccess.new.tap do |hash|
        # attribute_names.each do |attr|
        #   hash[attr[0..-4].to_sym] = attr if attr.end_with? '_id'
        # end
      end
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
