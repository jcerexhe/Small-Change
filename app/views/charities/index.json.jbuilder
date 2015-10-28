json.array!(@charities) do |charity|
  json.extract! charity, :id, :name, :logo, :bsb, :account_number, :contact_name, :contact_email, :abn, :address
  json.url charity_url(charity, format: :json)
end
