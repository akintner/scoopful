class Checkout

  attr_reader :contents

  def initialize(contents)
    @contents = contents
  end

  def submit(order)
    contents.each do |item_id, quantity|
      order.orders_items.create(
        item_id: item_id.to_i, 
        quantity: quantity, 
        current_price_per_unit: Item.find(item_id).price_per_unit
      )
    end
  end
end