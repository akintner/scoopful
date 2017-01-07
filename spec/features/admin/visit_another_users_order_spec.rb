require 'rails_helper'

RSpec.feature "Visit another user's order" do

  scenario "admins can see all order details" do
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

  scenario "visitor cannot see order details" do
    user = create(:user_with_orders)
    order = user.orders.first
    visit order_path(order)
    
    expect(current_path).to eq(login_path)
  end

  scenario "users cannot see another user's order details" do
    user1 = create(:user)
    user2 = create(:user_with_orders)
    order = user2.orders.first
    login_user(user1)
    visit order_path(order)

    expect(current_path).to eq(dashboard_path)
  end

end
