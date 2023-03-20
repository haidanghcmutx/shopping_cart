class CreateShops < ActiveRecord::Migration[7.0]
  def change
    create_table :shops do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.string :description
      t.text :tax_code
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
