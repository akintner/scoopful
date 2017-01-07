require 'rails_helper'

RSpec.feature 'Cart Checkout' do
  before do
    @category = create(:category_with_items)
    @item1 = @category.items.first
    @item2 = @category.items.last
    @user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  scenario 'user can checkout when logged in' do
    visit items_path
    add_item_to_cart(@item1)
    click_on 'View Cart'
    click_on 'Check out Cart'

    expect(current_path).to eq(orders_path)
    expect(page).to have_content("Order was successfully placed")
    expect(page).to have_content("Order # #{@user.orders.last.id}")
  end

end
