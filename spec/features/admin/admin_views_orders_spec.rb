require 'rails_helper'

RSpec.feature do
  before do
    create_list(:order_with_items, 2, status: 0)
    create_list(:order_with_items, 2, status: 1)
    create_list(:order_with_items, 2, status: 2)
    create_list(:order_with_items, 2, status: 3)
    @orders = Order.all
    admin = create(:user, role: 1)
    login_stub(admin)
    visit admin_dashboard_path
  end
  
  context 'visit admin dashboard' do
    context 'admin' do
      scenario 'see all orders with links' do

        @orders.each do |order|
          expect(page).to have_content order.id
          expect(page).to have_content order.user.name
          expect(page).to have_link 'Order Details', href: order_path(order)
        end
      end

      scenario 'filter orders by status' do
        Order.statuses.keys.each do |status|
          within '.sort-by' do
            click_on status
          end
          expect(current_path).to eq admin_dashboard_path
          expect(page).to have_content "#{status.capitalize} Orders"
          expect_only_orders("#{status}?")
        end
      
        click_on 'all'

        expect(current_path).to eq admin_dashboard_path
        expect(page).to have_content 'Orders'
        @orders.each do |order|
          expect(page).to have_content order.id
        end
      end
    end
  end
end