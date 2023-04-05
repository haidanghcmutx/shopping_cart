class Order < ApplicationRecord
  belongs_to :user  
  has_many :order_details
  validates :total_price, presence: true
end
