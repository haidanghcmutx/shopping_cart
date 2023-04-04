class AddAttrToCart < ActiveRecord::Migration[7.0]
  def change
    add_column :carts, :quantity, :integer
    add_column :carts, :total_price, :decimal
  end
end
