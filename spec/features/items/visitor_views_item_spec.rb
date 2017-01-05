# As a user if I visit an item page and that item has been retired
# Then I should still be able to access the item page
# And I should not be able to add the item to their cart
# And I should see in place of the "Add to Cart" button or link - "Item Retired"

require 'rails_helper'

RSpec.feature 'Vistor views item' do

  scenario 'they can see the items details' do
    item = create(:item)
    visit item_path(item)

    expect(page).to have_content item.name
    expect(page).to have_content item.description
    expect(page).to have_content item.description
    expect(page).to have_content item.price_per_unit
    expect(page).to have_css "img[src=\"#{item.image_url}\"]"
    expect(page).to have_content item.category.title
  end

  scenario 'they can add to cart if it is active' do
    item = create(:item)
    visit item_path(item)
    click_button('Add to Cart')
    expect(current_path).to eq item_path(item)

    click_on 'View Cart'

    expect(current_path).to eq cart_path
    expect(page).to have_content item.name
    expect(page).to have_content item.description
    expect(page).to have_content item.price_per_unit
    expect(page).to have_css "img[src=\"#{item.image_url}\"]"

    expect(page).to have_content "Total Price: $#{item.price_per_unit}"
  end

  scenario 'they cannot add it to cart if it is retired' do
    item = create(:item, status: :retired)
    visit item_path(item)
    
    expect(page).to have_content('Item Retired')
    expect(page).to_not have_content('Add to Cart')
  end

end