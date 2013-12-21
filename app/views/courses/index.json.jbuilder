json.array!(@courses) do |course|
  json.extract! course, :title, :letters, :number
  json.url course_url(course, format: :json)
end
