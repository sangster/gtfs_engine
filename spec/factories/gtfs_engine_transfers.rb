# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :gtfs_engine_transfer, :class => 'Transfers' do
    from_stop_id "MyString"
    to_stop_id "MyString"
    transfer_type 1
    min_transfer_time 1
  end
end
