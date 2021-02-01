class CreateSourceTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :source_types, if_not_exists: true do |t|
      t.string :name
      t.timestamps
    end
  end
end
