require 'rails_helper'

RSpec.feature do
  context 'user' do
    scenario 'logs out' do
      user = create(:user)

      visit login_path

      fill_in :email, with: user.email
      fill_in :password, with: 'password'
      click_on 'Enter'

      click_on 'Logout'

      expect(current_path).to eq root_path
      expect(page).to have_link 'Login'
      expect(page).to_not have_content "Logged in as #{user.first_name}"
    end
  end
end