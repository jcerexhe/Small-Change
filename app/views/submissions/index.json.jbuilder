json.array!(@submissions) do |submission|
  json.extract! submission, :id, :url, :user_id, :charity_id, :cause_id
  json.url submission_url(submission, format: :json)
end
