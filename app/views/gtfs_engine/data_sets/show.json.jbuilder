json.status 'success'
json.data do
  json.set! 'data_set' do
    json.extract! @data_set, *%i(id name title url etag created_at)
    json.details @data_set.details
  end
end
