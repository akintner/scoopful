require 'rails_helper'

RSpec.feature do
  context 'visitor' do
    context 'creates an account' do
      scenario 'and is logged in' do
        visit login_path

        click_on 'Create Account'

        fill_account_info
        click_on 'Submit'

        expect(current_path).to eq dashboard_path
        expect(page).to have_content 'Logged in as Arya'
        expect(page).to have_content 'Arya Stark'
        expect(page).to have_content 'agirl@hasnoname.com'
        expect(page).to_not have_link 'Login'
        expect(page).to have_link 'Logout'
      end
    end

    scenario 'with invalid data' do
      visit new_user_path

      click_on 'Submit'

      expect(page).to have_content "First name can't be blank"
    end
  end
end