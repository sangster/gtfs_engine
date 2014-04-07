# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :gtfs_engine_frequency, :class => 'Frequencies' do
    trip_id "MyString"
    start_time 1
    end_time 1
    headway_secs 1
    exact_times false
  end
end
