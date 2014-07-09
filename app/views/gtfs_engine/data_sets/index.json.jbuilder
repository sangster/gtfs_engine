json.ignore_nil! true

json.status 'success'
json.data do
  json.set! 'dataSets' do
    json.array! @data_sets do |data_set|
      json.extract! data_set, *%i(id name url etag created_at)
    end
  end
end
