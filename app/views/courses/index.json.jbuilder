json.array!(@courses) do |course|
  json.extract! course, :title, :call_letters, :number
  json.url course_url(course, format: :json)
end
