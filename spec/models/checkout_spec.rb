require 'rails_helper'

RSpec.describe Checkout, type: :model do
  before do
    @item1, @item2 = create_list(:item, 2)
    @cart_contents = {@item1.id.to_s => 3, @item2.id.to_s => 1}
    @checkout = Checkout.new(@cart_contents)
  end
  
  it 'returns cart contents' do

    expect(@checkout.contents).to eq @cart_contents
  end

  it 'submits an order' do
    order = create(:order)

    @checkout.submit(order)

    order_item1 = order.orders_items.find_by(item_id: @item1.id)
    order_item2 = order.orders_items.find_by(item_id: @item2.id)

    expect(order.orders_items.count).to eq 2
    
    expect(order_item1.quantity).to eq 3
    expect(order_item1.current_price_per_unit).to eq @item1.price_per_unit
  
    expect(order_item2.quantity).to eq 1
    expect(order_item2.current_price_per_unit).to eq @item2.price_per_unit
  end
end