class CreateSources < ActiveRecord::Migration[6.1]
  def change
    create_table :sources, if_not_exists: true do |t|
      t.string :author_firstname
      t.string :author_middlename
      t.string :author_lastname
      t.string :book_title
      t.string :edition_number
      t.string :city_name
      t.string :publisher_name
      t.string :publication_year
      
      t.timestamps
    end
  end
end
