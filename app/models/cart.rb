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
    items.map { |item| item.price_per_unit * contents[item.id.to_s] }.sum
  end
end
