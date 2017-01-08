require 'rails_helper'

RSpec.feature do
  before do
    admin = create(:user, role: 1)
    login_stub(admin)
  end

  context 'visit admin dashboard' do
    context 'admin' do
      scenario 'change order status from ordered to cancelled' do
        order = create(:order_with_items, status: 0)
        visit admin_dashboard_path

        click_on 'cancel'

        expect(current_path).to eq admin_dashboard_path
        expect(page).to have_content "Order #{order.id} successfully updated"
        expect(order.cancelled?).to be_truthy 
      end

      scenario 'change order status from paid to cancelled' do
        order = create(:order_with_items, status: 1)
        visit admin_dashboard_path

        click_on 'cancel'

        expect(current_path).to eq admin_dashboard_path
        expect(page).to have_content "Order #{order.id} successfully updated"
        expect(order.cancelled?).to be_truthy 
      end

      scenario 'change order status from paid to completed' do
        order = create(:order_with_items, status: 1)
        visit admin_dashboard_path

        click_on 'mark as completed'

        expect(current_path).to eq admin_dashboard_path
        expect(page).to have_content "Order #{order.id} successfully updated"
        expect(order.completed?).to be_truthy 
      end

      scenario 'change order status from ordered to paid' do
        order = create(:order_with_items, status: 0)
        visit admin_dashboard_path

        click_on 'mark as paid'

        expect(current_path).to eq admin_dashboard_path
        expect(page).to have_content "Order #{order.id} successfully updated"
        expect(order.paid?).to be_truthy
      end
    end 
  end
end
