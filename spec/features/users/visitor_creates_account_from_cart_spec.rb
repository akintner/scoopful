require 'rails_helper'

RSpec.feature do
  before do
    @category = create(:category_with_items)
    @item = @category.items.first
    @item2 = @category.items.last

    visit items_path

    within "section##{@item.name.tr(' ', '-')}" do
      click_button('Add to Cart')
    end
    within "section##{@item2.name.tr(' ', '-')}" do
      click_button('Add to Cart')
    end
  end

  context 'visitor' do
    scenario 'creates an account from the cart page' do
      visit cart_path
      expect(page).to_not have_content 'Check out Cart'

      old_total = (@item.price_per_unit + @item2.price_per_unit).round(2)
      expect(page).to have_content "Total Price: $#{old_total}"

      within 'li.cart-item:nth-child(1)' do
        expect(page).to have_content @item.name
        expect(find_field('Quantity').value).to eq '1'
        expect(page).to have_content "Subtotal: $#{@item.price_per_unit}"
      end

      within 'li.cart-item:nth-of-type(2)' do
        expect(page).to have_content @item2.name
        expect(find_field('Quantity').value).to eq '1'
        expect(page).to have_content "Subtotal: $#{@item2.price_per_unit}"
      end

      click_on 'Log in or Register to Check out'

      fill_account_info
      click_on 'Submit'

      visit cart_path

      expect(page).to have_content 'Check out Cart'
      expect(page).to have_content "Total Price: $#{old_total}"
      within 'li.cart-item:nth-child(1)' do
        expect(page).to have_content @item.name
        expect(find_field('Quantity').value).to eq '1'
        expect(page).to have_content "Subtotal: $#{@item.price_per_unit}"
      end
      within 'li.cart-item:nth-of-type(2)' do
        expect(page).to have_content @item2.name
        expect(find_field('Quantity').value).to eq '1'
        expect(page).to have_content "Subtotal: $#{@item2.price_per_unit}"
      end
      
      click_on 'Logout'

      expect(page).to have_link 'Login', href: login_path
      expect(page).to_not have_link 'Logout', href: logout_path
    end
  end
end