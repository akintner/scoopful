=begin 
Background: An unauthenticated user and their abilities
As an Unuthenticated User
I cannot view another user's private data, such as current order, etc.
I should be redirected to login/create account when I try to check out.
I cannot view the administrator screens or use administrator functionality.
I cannot make myself an administrator.
=end

require 'rails_helper'

RSpec.feature do
  before do
    @user = create(:user_with_orders)
  end

  context 'visitor' do
    scenario 'cannot view another user\'s orders' do
      visit orders_path

      expect(page).to have_content 'The page you were looking for doesn\'t exist (404)'
    end

    scenario 'cannot view administrator dashboard' do
      visit admin_dashboard_path

      expect(page).to have_content 'The page you were looking for doesn\'t exist (404)'
    end
  end
end
