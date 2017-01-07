require 'rails_helper'

RSpec.describe do

  before do
    @user = create(:user_with_orders)
    @order = @user.orders.first
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  context 'user' do
    scenario 'sees all orders and picks one to view' do

      visit orders_path

      expect(page).to have_content 'Welcome to Your Orders'

      click_on "Order # #{@user.orders.first.id}, ordered at #{@user.orders.first.created_at}."

      expect(current_path).to eq(order_path(@user.orders.first))
    end

    scenario 'sees that order and all of its items' do
      visit order_path(@order)
      
      expect(page).to have_content @order.status
      expect(page).to have_content @order.total_price
      expect(page).to have_content @order.created_at
      expect(page).to have_content @order.updated_at

      @order.items.each do |item|
        expect(page).to have_content item.name
        expect(page).to have_content @order.item_quantity(item)
      end

      click_on @order.items.first.name
      expect(current_path).to eq(item_path(@order.items.first))
    end
  end
end