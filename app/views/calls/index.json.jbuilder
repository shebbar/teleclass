json.array!(@calls) do |call|
  json.extract! call, :id, :call_date, :call_time, :duration
  json.url call_url(call, format: :json)
end
