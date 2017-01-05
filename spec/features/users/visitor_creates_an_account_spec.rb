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

    context 'creates an account' do
      scenario 'and is logged in' do
        visit login_path

        click_on 'Create Account'

        fill_in 'user[first_name]', with: 'Arya'
        fill_in 'user[last_name]', with: 'Stark'
        fill_in 'user[email]', with: 'agirl@hasnoname.com'
        fill_in 'user[password]', with: 'password'
        fill_in 'user[password_confirmation]', with: 'password'
        click_on 'Submit'

        expect(current_path).to eq dashboard_path
        expect(page).to have_content 'Logged in as Arya'
        expect(page).to have_content 'Arya'
        expect(page).to have_content 'Stark'
        expect(page).to have_content 'agirl@hasnoname.com'
        expect(page).to_not have_link 'Login'
        expect(page).to have_link 'Logout'
      end
    end
  end

  scenario 'tries to create an account without name' do
    visit new_user_path

    click_on 'Submit'

    expect(page).to have_content "First name can't be blank"
  end
end