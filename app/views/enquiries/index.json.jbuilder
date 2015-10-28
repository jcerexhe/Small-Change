json.array!(@enquiries) do |enquiry|
  json.extract! enquiry, :id, :enquiry_type, :name, :email, :message, :user_id
  json.url enquiry_url(enquiry, format: :json)
end
