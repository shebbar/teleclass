json.array!(@subjects) do |subject|
  json.extract! subject, :id, :name, :grade
  json.url subject_url(subject, format: :json)
end
