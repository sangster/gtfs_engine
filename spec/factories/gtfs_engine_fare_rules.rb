# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :gtfs_engine_fare_rule, :class => 'FareRule' do
    fare_id "MyString"
    route_id "MyString"
    origin_id "MyString"
    destination_id "MyString"
    contains_id "MyString"
  end
end
