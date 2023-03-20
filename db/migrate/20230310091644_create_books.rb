class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.decimal :price
      t.date :year
      t.text :description
      t.string :img_url
      t.integer :amount
      
      t.references :shop, null: false, foreign_key: true
      t.timestamps
    end
  end
end
