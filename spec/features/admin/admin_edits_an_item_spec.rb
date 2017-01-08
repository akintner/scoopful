=begin
issueTwentyTwo:
title: Admin edits an item
body: >
Background: an existing item
As an admin
When I visit "admin/items"
And I click "Edit"
Then my current path should be "/admin/items/:ITEM_ID/edit"
And I should be able to upate title, description, image, and status
=end

require 'rails_helper'

RSpec.feature do
  before do
    @item = create(:item)
    visit admin_items_path
    click_on 'Edit'
  end

  context 'admin' do
    scenario 'can edit an item\'s title' do
      fill_in 'item[title]', with: 'NewTitle'
      click_on 'Update'

      expect(page).to have_content 'Item updated!'
      expect(page).to have_content 'NewTitle'
    end

    xscenario 'can edit an item\'s description' do
    end

    xscenario 'can edit an item\'s image' do
    end

    xscenario 'can edit an item\'s status' do
    end
  end
end