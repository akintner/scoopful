require 'rails_helper'

RSpec.describe do
  context 'user' do
    scenario 'sees all orders' do
      @user = create(:user_with_orders)
      orders = @user.orders
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

      visit orders_path

      order = @user.orders.first
      expect(page).to have_content 'Welcome to Your Past Orders'
      expect(page).to have_content order.created_at
    end
  end
end