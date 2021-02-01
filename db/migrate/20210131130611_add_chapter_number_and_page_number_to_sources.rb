class AddChapterNumberAndPageNumberToSources < ActiveRecord::Migration[6.1]
  def change
    add_column :sources, :chapter, :string
    add_column :sources, :page, :string
  end
end
