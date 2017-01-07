class OrdersItem < ApplicationRecord
  belongs_to :item
  belongs_to :order

  def subtotal
    current_price_per_unit * quantity
  end

end