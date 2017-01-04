=begin 
As a visitor
When I visit any page with an item on it
I should see a link or button for "Add to Cart"
When I click "Add to cart" for that item
And I click a link or button to view cart
And my current path should be "/cart"
And I should see a small image, title, description and price for the item I just added
And there should be a "total" price for the cart that should be the sum of all items in the cart
=end

require 'rails_helper'

RSpec.feature do
  before do
    @category = create(:category_with_items)
    @item1 = @category.items.first
    @item2 = @category.items.last
  end

  context "visitor" do
    scenario "adds an item to their cart" do
      visit items_path

      click_button("Add to Cart", match: :first) 

      click_on "View Cart"

      expect(current_path).to eq cart_path
      expect(page).to have_content @item1.name
      expect(page).to have_content @item1.description
      expect(page).to have_content @item1.price_per_unit
      expect(page).to have_css "img[src=\"#{@item1.image_url}\"]"

      expect(page).to have_content "Total Price: #{@item1.price_per_unit}"
    end
  end
end