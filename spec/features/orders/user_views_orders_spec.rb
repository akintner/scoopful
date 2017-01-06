require 'rails_helper'

RSpec.describe do
  context 'user' do
    scenario 'sees all orders' do
      user = create(:user)
      orders = create(:order)
      
      visit orders_path

      expect(page).to have_content 'Welcome to Your Orders'
      expect(page).to have_content order.total_cost

      orders.each do |item|
        expect(page).to have_content item.name
        expect(page).to have_content item.price_per_unit
      end
    end
  end
end