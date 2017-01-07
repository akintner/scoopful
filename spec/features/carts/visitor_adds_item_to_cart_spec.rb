require 'rails_helper'

RSpec.feature do
  before do
    @category = create(:category_with_items)
    @item1 = @category.items.first
    @item2 = @category.items.last
  end

  context 'visitor' do
    scenario 'adds an item to their cart from the items index page' do
      visit items_path

      click_button('Add to Cart', match: :first)
      expect(current_path).to eq items_path

      click_on 'View Cart'

      verify_cart_addition(@item1)
    end

    scenario 'adds an item to their cart from a category page' do
      category = create(:category_with_items)
      item = category.items.first

      visit category_path(category.title)

      click_button('Add to Cart', match: :first)
      expect(current_path).to eq category_path(category.title)

      click_on 'View Cart'

      verify_cart_addition(item)      
    end
  end
end
