require 'rails_helper'

RSpec.describe do
  context 'user' do
    scenario 'sees all orders' do
      user = create(:user)
      order = create(:order)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit orders_path

      expect(page).to have_content 'Welcome to Your Orders'
      expect(page).to have_content order.total_cost
    end
  end

  context 'user not logged in' do
    scenario 'user forgets to log in and tries to view all orders' do
      visit orders_path 

      expect(page).to have_content 'You must be logged in to view your orders.'
    end
  end
end