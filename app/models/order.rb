class Order < ApplicationRecord
  belongs_to :user  
  validates :status, presence: true
  validates :total_price, presence: true
  validates :shipping_address, presence: true
  validates :date_payment, presence:true
end
