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
    xscenario 'cannot view another user\'s orders' do
    end

    xscenario 'cannot view administrator dashboard' do
    end

    xscenario 'cannot make themself an admin' do
    end
  end
end
