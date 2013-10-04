# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

find_book = (isbn) ->
  content = $('#content')
  if isbn isnt "" and isbn.length is 13 and parseInt(isbn, 10)
    url = "https://www.googleapis.com/books/v1/volumes?q=isbn:"+isbn+"&key=AIzaSyDqJ6dEoT_kIbfBSV8ztbZOqzZCqRRQtQc"
    console.log url
    $.get url, (data) ->
      if data.totalItems isnt 0
        console.log data
        book = data['items'][0].volumeInfo
        console.log book
        book_div = $('<div class="bk_div">')
        img_div = $('<div id="bk_img">')
        img = $('<img>').attr('src', book.imageLinks.thumbnail)
        link = '<a href=' + book.canonicalVolumeLink + '>'
        img.attr('alt', book.title)
        img_link = $(link)
        img.appendTo(img_link)
        img_link.appendTo(img_div)
        book_div.append(img_div)
        
        info_div = $('<div id="bk_info">')
        info_div.append('<div id="bk_title">' + book.title)
        info_div.append('<div id="bk_authors">by ' + book.authors.join(' | '))
        description = $('<div id="bk_dsc">')
        description.html(book.description)
        info_div.append(description)
        book_div.append(info_div)
        
        book_div.insertAfter($('#search_link'))
      else
        $('<div class="error">').html("Could not find book").insertAfter($('#search_link'))
        setTimeout (->
          $('.error').fadeOut(1000, -> $('.error').remove())
        ), 1000
  else
    $('<div class="error">').html("Invalid search").insertAfter($('#search_link'))
    setTimeout (->
      $('.error').fadeOut(1000, -> $('.error').remove())
    ), 1000

$(document).ready ->
  if $('#search_link').length > 0
    console.log "Setting onClick for Search Button"
    input = $('#isbn_search');
    $('#search_link').click (event) ->
      event.preventDefault()
      console.log "clicked"
      find_book input.val()

    default_value = input.val();
    input.focus(->
        if input.val() is default_value
          input.val ""
          input.css('color', '#000')
    ).blur(->
        if input.val().length is 0
          input.val default_value
          input.css('color', '#bbb')
    )