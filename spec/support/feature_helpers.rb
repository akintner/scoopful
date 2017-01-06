module FeatureHelpers
  def fill_account_info
    fill_in 'user[first_name]', with: 'Arya'
    fill_in 'user[last_name]', with: 'Stark'
    fill_in 'user[email]', with: 'agirl@hasnoname.com'
    fill_in 'user[password]', with: 'password'
    fill_in 'user[password_confirmation]', with: 'password'
  end

  def add_item_to_cart(item)
    within "section##{item.name.tr(' ', '-')}" do
      click_button('Add to Cart')
    end
  end
end