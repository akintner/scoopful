class Order < ApplicationRecord  
  belongs_to :user
  has_many :orders_items
  has_many :items, through: :orders_items

  enum status: %w(ordered paid cancelled completed)

  def total_price
    orders_items.map { |item| item.current_price_per_unit * item.quantity.to_f }.sum
  end

  def item_quantity(item)
    orders_items.where(item_id: item.id).count
  end

  def subtotal(item)
    item_quantity(item) * orders_items.find_by(item_id: item.id).current_price_per_unit
  end

  def order_item(item)
    orders_items.find_by(item_id: item.id)
  end

  def order_item_quantity(item)
    order_item(item).quantity
  end
end