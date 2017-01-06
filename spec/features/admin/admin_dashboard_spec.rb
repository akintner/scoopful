require 'rails_helper'

RSpec.feature do 
  context 'visit admin dashboard'
    context 'admin' do
      scenario 'see dashboard' do
        admin = create(:user, role: 1)
        login_user(admin)

        visit admin_dashboard_path

        expect(page).to have_content 'Admin Dashboard'
      end
    end

  context 'user' do
    scenario '404' do
      user = create(:user)
      login_user(user)

      visit admin_dashboard_path

      expect(page).to have_content "The page you were looking for doesn't exist (404)"
    end
  end

  context 'visitor' do
    scenario '404' do
      visit admin_dashboard_path

      expect(page).to have_content "The page you were looking for doesn't exist (404)"
    end
  end
end