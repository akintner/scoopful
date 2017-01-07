require 'rails_helper'

RSpec.describe Order, type: :model do
  context 'associations' do
    it { should belong_to :user }
    it { should have_many :items }
    it { should have_many :orders_items }
  end

  it 'can be created as ordered' do
    order = create(:order)

    expect(order.status).to eq('ordered')
    expect(order.ordered?).to be_truthy
  end

  it 'can be updated to paid' do
    order = create(:order)
    order.status = :paid

    expect(order.status).to eq('paid')
    expect(order.paid?).to be_truthy
  end

  it 'can be updated to cancelled' do
  end

  it 'can be updated to completed' do
  end

  it 'can return total price' do
    order = create(:order_with_items)

    expect(order.total_price).to eq(3.98)
  end

  it 'can return total quantity of item' do
    order = create(:order_with_items)

    expect(order.item_quantity(order.items.first)).to eq(2)
  end

end