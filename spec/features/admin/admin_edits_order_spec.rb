require 'rails_helper'

RSpec.feature do
  before do
    admin = create(:user, role: 1)
    login_stub(admin)
  end

  context 'visit admin dashboard' do
    context 'admin' do
      scenario 'change order status from ordered to cancelled' do
        create(:order_with_items, status: 0)
        visit admin_dashboard_path

        expect(Order.cancelled.count).to eq 0

        click_on 'cancel'

        expect(Order.cancelled.count).to eq 1
      end

      scenario 'change order status from paid to cancelled' do
        create(:order_with_items, status: 1)
        visit admin_dashboard_path

        expect(Order.cancelled.count).to eq 0

        click_on 'cancel'

        expect(Order.cancelled.count).to eq 1
      end

      scenario 'change order status from paid to completed' do
        create(:order_with_items, status: 1)
        visit admin_dashboard_path

        expect(Order.completed.count).to eq 0

        click_on 'mark as completed'

        expect(Order.completed.count).to eq 1
      end

      scenario 'change order status from ordered to paid' do
        create(:order_with_items, status: 0)
        visit admin_dashboard_path

        expect(Order.paid.count).to eq 0
        
        click_on 'mark as paid'

        expect(Order.paid.count).to eq 1
      end
    end
  end
end