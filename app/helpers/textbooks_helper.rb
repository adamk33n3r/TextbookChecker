module TextbooksHelper
  def self.find_book(isbn)
    response = HTTParty.get("https://www.googleapis.com/books/v1/volumes?q=isbn:" + isbn + "&key=AIzaSyDqJ6dEoT_kIbfBSV8ztbZOqzZCqRRQtQc&country=US")
    if response["items"]
      book_hash = response["items"][0]
      Hashie::Mash.new book_hash
    end
  end
  
  def self.build_book(book_info)
    textbook = Textbook.new
    textbook.title = book_info.volumeInfo.title
    textbook.authors = book_info.volumeInfo.authors.join(", ")
    textbook.isbn = book_info.volumeInfo.industryIdentifiers[1].identifier
    textbook.description = book_info.volumeInfo.description
    textbook.price = book_info.saleInfo.retailPrice ? book_info.saleInfo.retailPrice.amount : 0
    textbook.published = Date.new book_info.volumeInfo.publishedDate.to_i
    textbook.image_url = book_info.volumeInfo.imageLinks.thumbnail
    textbook.edition = "Unknown"
    textbook.is_ebook = book_info.saleInfo.isEbook
    textbook
  end
end
