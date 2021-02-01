class Source < ApplicationRecord
  belongs_to :source_type, optional: true
  
  def book_info_snippet
    author_lastname + " " + 
    author_firstname[0] + 
    author_middlename[0] + ". " + 
    book_title.capitalize() + ". " + 
    edition_number + ". udgave. " + 
    city_name.capitalize() + ": " +
    publisher_name.capitalize() + "; " +
    publication_year + ". Kapitel " +
    chapter + ". " +
    page 
  end
  
  
end
