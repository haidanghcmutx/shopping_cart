class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.boolean :status
      t.decimal :total_price
      t.string :shipping_address
      t.string :payment_method
      t.references :user, null: false, foreign_key: true
      t.date :date_payment

      t.timestamps
    end
  end
end
