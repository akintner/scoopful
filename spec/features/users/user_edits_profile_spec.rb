require 'rails_helper'

RSpec.feature do
  before do
    @user  = create(:user)
    @user2 = create(:user)
    login_stub(@user)
  end

  context 'loggin in user' do
    scenario 'edits profile information' do
      visit dashboard_path

      click_on 'Update Profile Information'

      edit_account_info(@user)

      click_on 'Update'

      @user.reload

      expect(@user.password).to eq 'password'
      expect(page).to have_content 'Mike'
      expect(page).to have_content 'Schutte'
      expect(page).to have_content 'mike@schutte.com'
      expect(page).to have_content 'Profile Updated!'
    end

    scenario 'cannot edit another user\'s profile' do
      visit edit_user_path(@user2)

      expect(page).to have_content 'You cannot modify another user\'s profile.'
    end
  end
end