module TextbookAssociationsHelper
  def textbook_association_link_string ta
    ta.nil? ? "Everything" : "#{link_to ta.textbook} in #{link_to "#{ta.professor.to_s.possessive}", ta.professor} #{link_to ta.course}".html_safe
  end
end