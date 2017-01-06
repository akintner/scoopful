# require 'rails_helper'

# RSpec.describe do
#   context 'user' do
#     scenario 'sees all orders and picks one to view' do
#       @user = create(:user_with_orders)
#       orders = @user.orders
#       allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

#       visit orders_path

#       expect(page).to have_content 'Welcome to Your Past Orders'

#       click_on @user.orders.first

#       expect(current_path).to eq("/order/#{@user.orders.first.id}")
#     end

#     scenario 'sees that order and all of its items' do
#       @user = create(:user_with_orders)
#       orders = @user.orders
#       @order = create_list(:order_with_items, 2)
#       allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

#       visit order_path(@order)
      
#       expect(page).to have_content @order.status
#       expect(page).to have_content @order.total_price
#       expect(page).to have_content @order.created_at
#       expect(page).to have_content @order.updated_at

#       @order.items.each do |item|
#         expect(page).to have_content item.name
#         expect(page).to have_content item.price_per_unit
#       end
#   end
#   end
# end