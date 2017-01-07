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

  def expect_404
    expect(page).to have_content "The page you were looking for doesn't exist (404)"
  end

  def expect_login_path
    expect(current_path).to eq login_path
  end

  def verify_cart_addition(item)
    expect(current_path).to eq cart_path
    expect(page).to have_content item.name
    expect(page).to have_content item.description
    expect(page).to have_content item.price_per_unit
    expect(page).to have_css "img[src=\"#{item.image_url}\"]"
    expect(page).to have_content "Total Price: $#{item.price_per_unit}"
  end

  def verify_quantity(item_info)
    item = item_info[:item]

    expect(current_path).to eq cart_path
    expect(page).to have_content item.name
    expect(find_field('Quantity').value).to eq item_info[:quantity]
  end

  def expect_item_info(item, quantity)
    expect(current_path).to eq cart_path
    expect(page).to have_content item.name
    expect(find_field('Quantity').value).to eq quantity
    expect(page).to have_content "Subtotal: $#{item.price_per_unit}"
  end

  def total(item1, item2, quantity = 1)
    (item1.price_per_unit * quantity + item2.price_per_unit).round(2)
  end

  def login_stub(user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end
end
