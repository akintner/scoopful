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

      edit_account_info(@admin)

      click_on 'Update'

      @admin.reload
      expect(@admin.password).to eq 'password'
      expect(page).to have_content 'Mike'
      expect(page).to have_content 'Schutte'
      expect(page).to have_content 'mike@schutte.com'
      expect(page).to have_content 'Profile Updated!'
    end

    scenario 'cannot modify another user\'s data' do
      visit edit_user_path(@user)

      expect(page).to have_content 'You cannot modify another user\'s profile.'
    end
  end
end