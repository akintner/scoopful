module FeatureHelpers
  def fill_account_info
    fill_in 'user[first_name]', with: 'Arya'
    fill_in 'user[last_name]', with: 'Stark'
    fill_in 'user[email]', with: 'agirl@hasnoname.com'
    fill_in 'user[password]', with: 'password'
    fill_in 'user[password_confirmation]', with: 'password'
  end
end