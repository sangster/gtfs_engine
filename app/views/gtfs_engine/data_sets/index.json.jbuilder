json.ignore_nil! true
json.array! @data_sets do |data_set|
  json.extract! data_set, *%i(id name url etag created_at)
end
