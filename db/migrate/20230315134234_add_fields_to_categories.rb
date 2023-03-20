class AddFieldsToCategories < ActiveRecord::Migration[7.0]
  def change
    add_column :categories, :name, :string
    add_column :categories, :description, :text
  end
end
