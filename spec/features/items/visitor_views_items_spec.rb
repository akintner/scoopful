require 'rails_helper'

RSpec.describe do
  context "visitor" do
    scenario "sees all items" do
      categories = create_list(:category_with_items, 4)
      items = categories.flat_map(&:items)

      visit items_path

      items.each do |item|
        expect(page).to have_content item.name
        expect(page).to have_content item.description
        expect(page).to have_content item.price_per_unit
        expect(page).to have_css "img[src=\"#{item.image_url}\"]"
      end
    end
  end
end