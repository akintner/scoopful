require 'rails_helper'

RSpec.feature do
  context 'visitor' do
    scenario 'cannot view /orders' do
      visit orders_path

      expect_login_path
    end

    xscenario 'cannot view /orders/:id' do # waiting on order show functionality
      order = create(:order)
      visit orders_path(order)

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
  end
end
