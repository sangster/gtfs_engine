# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :gtfs_engine_fare_attribute, :class => 'FareAttribute' do
    fare_id "MyString"
    price 1.5
    currency_type "MyString"
    payment_method 1
    transfers 1
    transfer_duration 1
  end
end
