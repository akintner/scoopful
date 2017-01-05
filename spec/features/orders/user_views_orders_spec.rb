require 'rails_helper'

RSpec.describe do
  context 'user' do
    scenario 'sees all orders' do
      order = create_list(:order_with_items, 4)

      visit orders_path

      expect(page).to have_content "Welcome to Your Orders"
      expect(page).to have_content order.total_cost

      order.items.each do |item|
        expect(page).to have_content item.name
        expect(page).to have_content item.price_per_unit
      end
    end
  end
end