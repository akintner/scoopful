class Cart
  attr_reader :contents

  def initialize(session_cart)
    @contents = session_cart || {}
  end

  def add_item(item_id)
    contents[item_id.to_s] ||= 0
    contents[item_id.to_s]  += 1
  end

  def count_of(item_id)
    contents[item_id.to_s]
  end

  def items
    item_ids = contents.keys
    Item.where(id: item_ids)
    # contents.keys.map { |item_id| Item.find(item_id) }
  end

  def total_price
    items.sum(:price_per_unit)
  end
end