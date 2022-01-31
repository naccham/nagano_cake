class Item < ApplicationRecord
  # belongs_to :genre
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  
  attachment :image
  
  def with_tax_price
    (price * 1.1).floor
  end
  
  validates :name, presence: true
  validates :image, presence: true
  validates :price, presence: true
  
end
