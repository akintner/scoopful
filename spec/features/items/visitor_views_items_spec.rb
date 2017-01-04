require 'rails_helper'

RSpec.describe do
  context "visitor" do
    scenario "sees all items" do
      items = create_list(:item, 2)

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