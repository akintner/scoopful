require 'rails_helper'

RSpec.feature do 
  context 'user' do
    before(:all) do
      user = create(:user)
      login_user(user)
    end

    scenario 'visits admin dashboard' do
      visit admin_dashboard_path

      expect_404
    end

    scenario 'cannot see another users order details' do
      user1 = create(:user)
      user2 = create(:user_with_orders)
      order = user2.orders.first
      login_user(user1)
      visit order_path(order)

      expect(current_path).to eq(dashboard_path)
    end
  end
end