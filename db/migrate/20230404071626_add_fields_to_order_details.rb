class AddFieldsToOrderDetails < ActiveRecord::Migration[7.0]
  def change
    add_column :order_details, :status, :boolean
    add_column :order_details, :quantity, :integer
    add_column :order_details, :total_price, :decimal
    add_reference :order_details, :Order, null: false, foreign_key: true
    add_reference :order_details, :Book, null: false, foreign_key: true
    add_reference :order_details, :Shop, null: false, foreign_key: true
  end
end
