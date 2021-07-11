class AddReadsToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :reads, :integer, default: 0
  end
end
