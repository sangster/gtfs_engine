module ActiveRecord
  module Associations
    class Association
      def build_record_with_shared_key(attributes)
        share_key attributes
        build_record attributes
      end
      alias_method_chain :build_record, :shared_key

      private

      def share_key(attributes)
        h = attributes.last
        if Hash === h and h.key? :shared_key
          key = h.delete :shared_key
          h.reverse_merge! foreign_key: key, primary_key: key
        end
      end
    end
  end
end
