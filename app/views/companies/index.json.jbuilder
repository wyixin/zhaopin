json.array!(@companies) do |company|
  json.extract! company, :id, :name, :contact, :email, :address, :website, :logo
  json.url company_url(company, format: :json)
end
