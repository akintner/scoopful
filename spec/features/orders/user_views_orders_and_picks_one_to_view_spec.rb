require 'rails_helper'

RSpec.describe do
  context 'user' do
    scenario 'sees all orders and picks one to view' do
      @user = create(:user_with_orders)
      orders = @user.orders
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

      visit orders_path

      expect(page).to have_content 'Welcome to Your Orders'

      click_on "Order # #{@user.orders.first.id}, ordered at #{@user.orders.first.created_at}."

      expect(current_path).to eq(user_order_path(@user, @user.orders.first))
    end

    scenario 'sees that order and all of its items' do
      @user = create(:user_with_orders)
      @order = @user.orders.first
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

      visit user_order_path(@user, @order)
      
      expect(page).to have_content @order.status.capitalize
      expect(page).to have_content @order.total_price
      expect(page).to have_content @order.created_at
      expect(page).to have_content @order.updated_at

      @order.items.each do |item|
        expect(page).to have_content item.name
        expect(page).to have_content @order.item_quantity(item)
      end
  end
  end
end