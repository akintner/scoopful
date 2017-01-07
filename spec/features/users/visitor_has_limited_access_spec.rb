require 'rails_helper'

RSpec.feature do
  context 'visitor' do
    scenario 'cannot view /orders' do
      visit orders_path

      expect_login_path
    end

    scenario 'cannot view /orders/:id' do # waiting on order show functionality
      order = create(:order)
      visit order_path(order)

      expect_login_path
    end

    scenario 'cannot view /dashboard' do
      visit dashboard_path

      expect_login_path
    end

    scenario 'cannot view /admin/dashboard' do
      visit admin_dashboard_path

      expect_login_path
    end


    scenario 'cannot see order details' do
      user = create(:user_with_orders)
      order = user.orders.first
      visit order_path(order)
      
      expect(current_path).to eq(login_path)
    end
  end
end
