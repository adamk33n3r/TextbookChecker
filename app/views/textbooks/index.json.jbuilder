json.array!(@textbooks) do |textbook|
  json.extract! textbook, :title, :authors, :edition, :price, :date, :isbn
  json.url textbook_url(textbook, format: :json)
end
