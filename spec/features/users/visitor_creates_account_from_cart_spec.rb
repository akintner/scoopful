require 'rails_helper'

RSpec.feature do
  before do
    @category = create(:category_with_items)
    @item = @category.items.first
    @item2 = @category.items.last

    visit items_path

    add_item_to_cart(@item)
    add_item_to_cart(@item2)
  end

  context 'visitor' do
    scenario 'creates an account from the cart page' do
      visit cart_path
      expect(page).to_not have_content 'Check out Cart'

      old_total = (@item.price_per_unit + @item2.price_per_unit).round(2)
      expect(page).to have_content "Total Price: $#{old_total}"

      verify_cart_item(item: @item, list_number: 1, quantity: 1)
      verify_cart_item(item: @item2, list_number: 2, quantity: 1)

      click_on 'Log in or Register to Check out'

      fill_account_info
      click_on 'Submit'

      visit cart_path

      expect(page).to have_content 'Check out Cart'
      expect(page).to have_content "Total Price: $#{old_total}"
      verify_cart_item(item: @item, list_number: 1, quantity: 1)
      verify_cart_item(item: @item2, list_number: 2, quantity: 1)
      
      click_on 'Logout'

      expect(page).to have_link 'Login', href: login_path
      expect(page).to_not have_link 'Logout', href: logout_path
    end
  end
end