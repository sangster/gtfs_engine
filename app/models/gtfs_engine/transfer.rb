module GtfsEngine
  class Transfer < ActiveRecord::Base
    belongs_to :data_set,  inverse_of: :transfers
    belongs_to :from_stop, inverse_of: :from_transfers,
               shared_key: :from_stop_id, class: 'Stop'
    belongs_to :to_stop, inverse_of: :to_transfers,
               shared_key: :to_stop_id, class: 'Stop'
  end
end
