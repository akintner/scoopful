class Cart
  attr_reader :contents

  def initialize(session_cart)
    @contents = session_cart || {}
  end

  def add_item(item_id, quantity = 1)
    contents[item_id.to_s] ||= 0
    contents[item_id.to_s]  += (1 * quantity)
  end

  def total_count
    contents.values.sum
  end

  def count_of(item_id)
    contents[item_id.to_s]
  end

  def items
    item_ids = contents.keys
    Item.where(id: item_ids)
  end

  def total_price
    items.map { |item| item.price_per_unit * contents[item.id.to_s] }.sum.round(2)
  end

  def remove(item_id)
    @contents.delete(item_id.to_s)
  end

  def subtotal_of(item_id)
    (Item.find(item_id).price_per_unit * contents[item_id.to_s]).round(2)
  end

  def update_item(cart_params)
    id       = cart_params['item_id']
    quantity = cart_params['quantity'].to_i

    process_item_quantity(id, quantity)
  end

  def process_item_quantity(id, quantity)
    return remove(id) if quantity <= 0
    contents[id.to_s] = quantity
  end
end