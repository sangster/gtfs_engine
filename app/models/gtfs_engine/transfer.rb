module GtfsEngine
  class Transfer < ActiveRecord::Base
    belongs_to :data_set,  inverse_of: :transfers
    belongs_to :from_stop, inverse_of: :from_transfers,
               foreign_key: :stop_id, primary_key: :from_stop_id
    belongs_to :to_stop, inverse_of: :from_transfers,
               foreign_key: :stop_id, primary_key: :to_stop_id
  end
end
