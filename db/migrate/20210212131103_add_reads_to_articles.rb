class AddReadsToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :reads, :interger, default: 0
  end
end
