class GtfsEngine::UnknownFilter < StandardError
  attr_reader :fields

  #@param fields [Array<String>] the names of the unknown fields which the
  # caller tried to filter with
  def initialize(fields)
    @fields = fields
  end

  def to_hash
    fields.each_with_object({}) do |field, hash|
      hash[field] = message
    end
  end
end
