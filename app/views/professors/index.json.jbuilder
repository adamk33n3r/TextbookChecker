json.array!(@professors) do |professor|
  json.extract! professor, :first_name, :last_name, :department, :status
  json.url professor_url(professor, format: :json)
end
