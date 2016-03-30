json.array!(@donations) do |donation|
  json.extract! donation, :id, :amount, :charity_id, :user_id, :submission_id
  json.url donation_url(donation, format: :json)
end
