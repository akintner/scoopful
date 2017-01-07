require 'rails_helper'

RSpec.feature do
  before do
    @orders = create_list(:order_with_items, 3)
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