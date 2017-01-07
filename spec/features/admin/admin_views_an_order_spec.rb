require 'rails_helper'

RSpec.feature "Admin visits an order" do

  scenario "they see the order's details" do
    admin = create(:user, role: 1)
    user = create(:user_with_orders)
    order = user.orders.first
    login_user(admin)

    visit order_path(order)
    expect(page).to have_content(order.created_at)
    expect(page).to have_content(user.name)
    expect(page).to have_content(user.email)
    expect(page).to have_content(order.total_price)
    expect(page).to have_content(order.status)
    order.items.each do |item|
      expect(page).to have_content(item.name)
      expect(page).to have_content(order.order_item_quantity(item))
      expect(page).to have_content(order.order_item(item).current_price_per_unit)
      expect(page).to have_content(order.subtotal(item))
    end
  end

end