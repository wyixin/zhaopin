json.array!(@companies) do |company|
  json.extract! company, :id, :name, :address, :contact, :phone, :email, :web_site, :logo, :logo_audit, :contents
  json.url company_url(company, format: :json)
end
