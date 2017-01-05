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

      click_button("Add to Cart", match: :first) 
      expect(current_path).to eq items_path

      click_on "View Cart"

      expect(current_path).to eq cart_path
      expect(page).to have_content @item1.name
      expect(page).to have_content @item1.description
      expect(page).to have_content @item1.price_per_unit
      expect(page).to have_css "img[src=\"#{@item1.image_url}\"]"

      expect(page).to have_content "Total Price: #{@item1.price_per_unit}"
    end

    scenario "adds an item to their cart from a category page" do
      category = create(:category_with_items)
      item = category.items.first

      visit category_path(category.title)

      click_button("Add to Cart", match: :first)
      expect(current_path).to eq category_path(category.title)

      click_on "View Cart"

      expect(current_path).to eq cart_path
      expect(page).to have_content item.name
      expect(page).to have_content item.description
      expect(page).to have_content item.price_per_unit
      expect(page).to have_css "img[src=\"#{item.image_url}\"]"

      expect(page).to have_content "Total Price: #{item.price_per_unit}"
    end
  end
end
