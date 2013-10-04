def div_to(text, link, options={})
  content_tag :div, options do
    link_to text, link
  end
end