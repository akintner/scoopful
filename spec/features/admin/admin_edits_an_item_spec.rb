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
    admin = create(:user, role: 1)
    login_stub(admin)
    visit admin_items_path
    click_on 'Edit'
  end

  context 'admin' do
    scenario 'can edit an item\'s title' do
      expect(page).to_not have_content 'NewTitle'

      fill_in 'item[name]', with: 'NewTitle'
      click_on 'Update'

      expect(page).to have_content 'Item Updated!'
      expect(page).to have_content 'NewTitle'
    end

    scenario 'can edit an item\'s description' do
      expect(page).to_not have_content 'New description'

      fill_in 'item[description]', with: 'New description'
      click_on 'Update'

      expect(page).to have_content 'Item Updated!'
      expect(page).to have_content 'New description'
    end

    scenario 'can edit an item\'s image' do
      expect(page).to_not have_xpath("//img[@src=\"/uploads/test.jpeg\"]")

      attach_file('image', "#{Rails.root}/spec/support/images/test.jpeg")
      click_on 'Update'


      expect(page).to have_content 'Item Updated!'
      expect(page).to have_xpath("//img[@src=\"/uploads/test.jpeg\"]")
    end

    scenario 'can retire an item' do
      choose 'retired'
      click_on 'Update'

      expect(page).to have_content 'Item Updated!'
      expect(page).to have_content 'retired'
    end

    scenario 'can activate an item' do
      choose 'retired'
      click_on 'Update'

      expect(page).to_not have_content 'active'

      click_on 'Edit'
      choose 'active'
      click_on 'Update'

      expect(page).to have_content 'Item Updated!'
      expect(page).to have_content 'active'
    end
  end
end