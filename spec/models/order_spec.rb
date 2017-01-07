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
    order = create(:order)
    order.status = :cancelled

    expect(order.status).to eq('cancelled')
    expect(order.cancelled?).to be_truthy
  end

  it 'can be updated to completed' do
    order = create(:order)
    order.status = :completed

    expect(order.status).to eq('completed')
    expect(order.completed?).to be_truthy
  end

  it 'can return total price' do
    order = create(:order_with_items)

    expect(order.total_price).to eq(3.98)
  end

  it 'can return total quantity of item' do
    order = create(:order_with_items)

    expect(order.item_quantity(order.items.first)).to eq(1)
  end

  it 'can calculate subtotal' do
    order = create(:order_with_items)

    expect(order.subtotal(order.items.first)).to eq(1.99)
  end

end