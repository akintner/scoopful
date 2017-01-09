require 'rails_helper'

RSpec.feature do
  before do
    @user = create(:user)
    login_stub(@user)
    item = create(:item)

    visit items_path
    add_item_to_cart(item)
  end
  
  context 'cart' do
    scenario 'resets after checkout' do
      visit cart_path
      click_on 'Check out Cart'

      click_on 'View Cart'

      expect(page).to have_content 'Total Price: $0.00'
      expect(page).to have_link 'Logout', href: logout_path
    end
  end
end