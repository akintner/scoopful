require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @user  = create(:user_with_orders)
    @user2 = create(:user)
    @order = create(:order)
    @user_order  = @user.orders.first

    @order_with_items = create(:order_with_items)
    @item = @order_with_items.items.first
    @order_item = @order_with_items.orders_items.first
  end

  context 'associations' do
    it { should belong_to :user }
    it { should have_many :items }
    it { should have_many :orders_items }
  end

  it 'can be created as ordered' do
    expect(@order.status).to eq('ordered')
    expect(@order.ordered?).to be_truthy
  end

  it 'can be updated to paid' do
    @order.status = :paid

    expect(@order.status).to eq('paid')
    expect(@order.paid?).to be_truthy
  end

  it 'can be updated to cancelled' do
    @order.status = :cancelled

    expect(@order.status).to eq('cancelled')
    expect(@order.cancelled?).to be_truthy
  end

  it 'can be updated to completed' do
    @order.status = :completed

    expect(@order.status).to eq('completed')
    expect(@order.completed?).to be_truthy
  end

  it 'can return total price' do
    expect(@order_with_items.total_price).to eq(3.98)
  end

  it 'can calculate subtotal' do
    expect(@order_with_items.subtotal(@item)).to eq(1.99)
  end

  it 'returns an order item' do
    expect(@order_with_items.order_item(@item)).to eq @order_item
  end

  it 'returns the quantity of an order item' do
    expect(@order_with_items.order_item_quantity(@item)).to eq @order_item.quantity
  end

  it 'returns AR collection of orders by status' do
    result = Order.by_status(:ordered)

    expect(result.class.to_s).to eq 'Order::ActiveRecord_Relation'
    expect(result.first.updated_at).to be > result[1].updated_at
  end

  context 'user verification' do 
    it 'accepts verified user' do
      result = @user_order.verified_user?(@user)

      expect(result).to be true
    end

    it 'rejects invalid user' do
      result = @user_order.verified_user?(@user2)

      expect(result).to be false
    end

    it 'accepts admin' do
      admin  = create(:user, role: 1)
      result = @user_order.verified_user?(admin)

      expect(result).to be true
    end
  end
end