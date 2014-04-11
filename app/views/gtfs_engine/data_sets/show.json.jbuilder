json.extract! @data_set, *%i(id name url etag created_at)
json.counts @data_set.record_counts
