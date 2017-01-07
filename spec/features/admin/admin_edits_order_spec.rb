require 'rails_helper'

RSpec.feature do
  before do
    user = create(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end

  context 'visit admin dashboard' do
    context 'admin' do
      scenario 'change order status from ordered to cancelled' do
        @order = create(:order_with_items, status: 0)
        visit admin_dashboard_path


        within '.order-info' do
          click_link 'cancel'
        end

        expect(@order.cancelled?).to be_truthy 
      end

      scenario 'change order status from paid to cancelled' do
        @order = create(:order_with_items, status: 1)
        visit admin_dashboard_path

        within '.order-info' do
          click_link 'cancel'
        end

        expect(@order.cancelled?).to be_truthy 
      end

      scenario 'change order status from paid to completed' do
        @order = create(:order_with_items, status: 1)
        visit admin_dashboard_path


        within '.order-info' do
          click_link 'mark as completed'
        end

        expect(@order.completed?).to be_truthy 
      end

      scenario 'change order status from ordered to paid' do
        @order = create(:order_with_items, status: 0)
        visit admin_dashboard_path


        within '.order-info' do
          click_link 'mark as paid'
        end

        expect(@order.paid?).to be_truthy 
      end
    end 
  end
end
