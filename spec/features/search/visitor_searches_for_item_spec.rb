require 'rails_helper'

RSpec.feature do
  before do
    @item = create(:item, description: 'So much protein')
  end

  context 'visitor' do
    scenario 'searches for an item' do
      visit items_path
      fill_in 'q[name_or_description_or_category_title_cont]', with: 'protein'
      click_on 'Search'

      expect(page).to have_content 'Results for "protein"'
      expect(page).to have_content @item.name
      expect(page).to have_content @item.description
      expect(page).to have_content @item.price_per_unit
    end

    scenario 'searches for an item with a fragment' do
      visit items_path
      fill_in 'q[name_or_description_or_category_title_cont]', with: 'rot'
      click_on 'Search'

      expect(page).to have_content 'Results for "rot"'
      expect(page).to have_content @item.name
      expect(page).to have_content @item.description
      expect(page).to have_content @item.price_per_unit
    end

    scenario 'gets no results if no items match' do
      visit items_path
      fill_in 'q[name_or_description_or_category_title_cont]', with: 'asdflasdf'
      click_on 'Search'

      expect(page).to have_content 'Results for "asdflasdf"'
      expect(page).to have_content 'Sorry, no results found.'
    end 
  end
end
