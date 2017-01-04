require 'rails_helper'

RSpec.feature "When a visitor goes to a category index" do

  scenario "they see all items associated with a category" do
    categories = create_list(:category, 2)
    
    categories.each do |category|
      visit "/#{category.title}"
    
      expect(current_path).to eq("/#{category.title}")
      expect(page).to have_content(category.title)
      category.items.each do |item|
        expect(page).to have_content(item.name)
        expect(page).to have_content(item.description)
        expect(page).to have_content(item.price_per_weight)
        expect(page).to have_css("img[src=\"#{item.image_url}\"]")
      end
    end
  end

end