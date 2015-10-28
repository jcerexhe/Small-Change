json.array!(@causes) do |cause|
  json.extract! cause, :id, :name, :description
  json.url cause_url(cause, format: :json)
end
