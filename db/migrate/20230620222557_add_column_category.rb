class AddColumnCategory < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :category, :string, null: false
    add_index :products, :category
  end
end
