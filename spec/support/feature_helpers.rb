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

  def verify_cart_item(item_info)
    item     = item_info[:item]
    number   = item_info[:list_number]
    quantity = item_info[:quantity]

    within "li.cart-item:nth-of-type(#{number})" do
      expect(page).to have_content item.name
      expect(find_field('Quantity').value).to eq quantity.to_s
      expect(page).to have_content "Subtotal: $#{item.price_per_unit}"
    end
  end

  def login_user(user)
    visit login_path
    fill_in :email, with: user.email
    fill_in :password, with: 'password'
    click_on 'Enter'
  end
end
