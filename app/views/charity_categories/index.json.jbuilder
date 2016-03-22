json.array!(@charity_categories) do |charity_category|
  json.extract! charity_category, :id, :charity_id, :category_name
  json.url charity_category_url(charity_category, format: :json)
end
