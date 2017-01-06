require 'rails_helper'

RSpec.feature 'Cart Checkout' do

  before do
    @category = create(:category_with_items)
    @item1 = @category.items.first
    @item2 = @category.items.last
    @user = create(:user)
  end

  scenario 'vistor can checkout by logging in' do
    visit items_path
    click_on 'Add to Cart', match: :first
    click_on 'View Cart'
    click_on 'Login or Register to Checkout'
    fill_in :email, with: user.email
    fill_in :password, with: 'password'
    click_on 'Enter'
    expect(current_path).to eq(cart_path)
    click_on 'Checkout'

    expect(current_path).to eq(order_path(user, user.orders.last))
    expect(page).to have_content("Order was successfully placed")
    expect(page).to have_content("Order # #{user.orders.last.id}")
    within "table" do
      
    end
  end

end