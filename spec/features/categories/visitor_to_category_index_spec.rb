require 'rails_helper'

RSpec.feature "When a visitor goes to a category index" do

  scenario "they see all items associated with a category" do
    category1, category1 = create_list(:category, 2)
    visit "/#{category1.title}"
    
    expect(current_path).to eq("/#{category1.title}")
    expect(page).to have_content(category1.title)
    expect(page).to have_content(category1.items.first.name)
  end

end