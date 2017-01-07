require 'rails_helper'

RSpec.feature do
  before do
    @ordered_orders = create_list(:order_with_items, 2, status: 0)
    @paid_orders = create_list(:order_with_items, 2, status: 1)
    @cancelled_orders = create_list(:order_with_items, 2, status: 2)
    @completed_orders = create_list(:order_with_items, 2, status: 3)
    @orders = Order.all
    user = create(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
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
        click_on 'ordered'

        expect(current_path).to eq admin_dashboard_path
        expect(page).to have_content 'Ordered Orders'
        expect_only_orders('ordered?')

        click_on 'paid'

        expect(current_path).to eq admin_dashboard_path
        expect(page).to have_content 'Paid Orders'
        expect_only_orders('paid?')

        click_on 'cancelled'

        expect(current_path).to eq admin_dashboard_path
        expect(page).to have_content 'Cancelled Orders'
        expect_only_orders('cancelled?')

        click_on 'completed'

        expect(current_path).to eq admin_dashboard_path
        expect(page).to have_content 'Completed Orders'
        expect_only_orders('completed?')

        click_on 'all'

        expect(current_path).to eq admin_dashboard_path
        expect(page).to have_content 'Orders'
        @orders.each do |order|
          expect(page).to have_content order.id
        end
      end

      scenario ' transitions between statuses' do

      end
    end
  end
end

# issueEighteen:
#    title: Admin Orders
#    body: >
#      As an Admin
#      When I visit the dashboard
#      Then I can see a listing of all orders
#      And I can see the total number of orders for each status **("Ordered", "Paid", "Cancelled", "Completed")**
#      And I can see a link for each individual order
#      And I can filter orders to display by each status type  **("Ordered", "Paid", "Cancelled", "Completed")**
#      And I have links to transition between statuses
#        - I can click on "cancel" on individual orders which are "paid" or "ordered"
#        - I can click on "mark as paid" on orders that are "ordered"
#        - I can click on "mark as completed" on orders that are "paid"