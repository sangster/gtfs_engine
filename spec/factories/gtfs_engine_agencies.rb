# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :gtfs_engine_agency, :class => 'Agency' do
    agency_id "MyString"
    agency_name "MyString"
    agency_url "MyString"
    agency_timezone "MyString"
    agency_lang "MyString"
    agency_phone ""
  end
end
