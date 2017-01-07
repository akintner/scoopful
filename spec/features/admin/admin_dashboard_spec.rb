require 'rails_helper'

RSpec.feature do
  context 'visit admin dashboard' do
    context 'admin' do
      scenario 'see dashboard' do
        admin = create(:user, role: 1)
        login_user(admin)

        visit admin_dashboard_path

        expect(page).to have_content 'Admin Dashboard'
      end

      scenario 'see a link to view all items' do 
        admin = create(:user, role: 1)
        login_user(admin)

        visit admin_dashboard_path

        expect(page).to have_link 'View All Items'
      end
    end
  end
end