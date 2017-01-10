require 'rails_helper'

RSpec.describe OrdersItem, type: :model do
  context 'assocations' do
    it { should respond_to :item }
    it { should respond_to :order }
  end

  context 'methods' do
    it 'can calculate subtotal' do
      order = create(:order_with_items)
      order_item = order.orders_items.first
      order_item.quantity = 2
      result = order_item.subtotal

      expected = 2 * order_item.current_price_per_unit
      expect(result).to eq expected
    end 
  end
end