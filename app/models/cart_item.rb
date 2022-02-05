class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :customer, optional: true

  def subtotal
    item.with_tax_price * amount
  end

end
