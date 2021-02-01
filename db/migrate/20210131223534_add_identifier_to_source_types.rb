class AddIdentifierToSourceTypes < ActiveRecord::Migration[6.1]
  def change
    add_column :source_types, :identifier, :string
  end
end
