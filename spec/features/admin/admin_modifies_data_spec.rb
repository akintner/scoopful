=begin 
As a logged in Admin
I can modify my account data
But I cannot modify any other user's account data
=end

require 'rails_helper'

RSpec.feature do
  before do
    @admin = create(:user, role: 1)
    @user  = create(:user)
    login_stub(@admin)
  end

  context 'admin' do
    scenario 'can modify own data' do
      visit admin_dashboard_path

      click_on 'Update Profile Information'

      fill_in 'user[first_name]', with: 'Mike'
      fill_in 'user[last_name]', with: 'Schutte'
      fill_in 'user[email]', with: 'mike@schutte.com'
      fill_in 'user[current_password]', with: @admin.password
      fill_in 'user[new_password]', with: 'password'
      fill_in 'user[new_password_confirmation]', with: 'password'

      click_on 'Update'

      @admin.reload
      expect(@admin.password).to eq 
      expect(page).to have_content 'Mike'
      expect(page).to have_content 'Schutte'
      expect(page).to have_content 'mike@schutte.com'
      expect(page).to have_content 'Profile updated!'
    end

    scenario 'cannot modify another user\'s data' do
    end
  end
end