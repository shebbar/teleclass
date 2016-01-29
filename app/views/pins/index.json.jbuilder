json.array!(@pins) do |pin|
  json.extract! pin, :id, :pincode, :serialcode
  json.url pin_url(pin, format: :json)
end
