require 'rails_helper'

RSpec.feature do 
  context 'user' do
    before(:all) do
      user = create(:user)
      login_user(user)
    end

    scenario 'visits admin dashboard' do
      visit admin_dashboard_path

      expect_404
    end
  end
end