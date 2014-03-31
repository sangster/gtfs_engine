module ActiveRecord
  require 'active_record/base'

  class << Base
    def belongs_to_with_shared_key(*args, &blk)
      share_key args
      belongs_to_without_shared_key *args, &blk
    end
    alias_method_chain :belongs_to, :shared_key

    def has_one_with_shared_key(*args, &blk)
      share_key args
      has_one_without_shared_key *args, &blk
    end
    alias_method_chain :has_one, :shared_key

    def has_many_with_shared_key(*args, &blk)
      share_key args
      has_many_without_shared_key *args, &blk
    end
    alias_method_chain :has_many, :shared_key

    private

    def share_key(args)
      h = args.last
      if Hash === h and h.key? :shared_key
        key = h.delete :shared_key
        h.reverse_merge! foreign_key: key, primary_key: key
      end
    end
  end
end
