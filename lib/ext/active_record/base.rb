module ActiveRecord
  class << Base
    def prefix_aliases(prefix, *aliases)
      aliases.each do |al|
        alias_attribute al, "#{prefix}_#{al}"
      end
    end
  end
end
