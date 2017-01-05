require 'rails_helper'

RSpec.feature do
  context 'visitor' do
    scenario 'sees login page' do
      visit root_path

      expect(page).to have_link 'Login'

      click_on 'Login'

      expect(current_path).to eq login_path
      expect(page).to have_field :email
      expect(page).to have_field :password
      expect(page).to have_button 'Enter'
      expect(page).to have_link 'Create Account'
    end

    scenario 'logs in with valid data' do
      user = create(:user)

      visit login_path

      fill_in :email, with: user.email
      fill_in :password, with: 'password'
      click_on 'Enter'

      expect(current_path).to eq dashboard_path
      expect(page).to have_content "#{user.first_name} #{user.last_name}"
      expect(page).to have_content user.email
      expect(page).to have_link 'Logout'
      expect(page).to_not have_link 'Login'
      expect(page).to have_content "Logged in as #{user.first_name}"
    end

    scenario 'logs in with invalid data' do
      visit login_path

      click_on 'Enter'

      expect(page).to have_content "Email can't be blank"
    end
  end
end
