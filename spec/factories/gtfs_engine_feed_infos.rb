# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :gtfs_engine_feed_info, :class => 'FeedInfo' do
    feed_publisher_name "MyString"
    feed_publisher_url "MyString"
    feed_lang "MyString"
    feed_start_date "2014-04-06"
    feed_end_date "2014-04-06"
    feed_version "MyString"
  end
end
