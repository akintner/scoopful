require 'rails_helper'

RSpec.feature do
  context 'visit admin dashboard' do
    scenario 'click on view all items' do
      admin = create(:user, role: 1)
      login_user(admin)

      visit admin_dashboard_path
      click_link 'View All Items'

      expect(current_path).to eq(admin_items_path)
    end

    scenario 'can view all items in table' do 
      admin = create(:user, role: 1)
      @items = create_list(:item, 4)
      login_user(admin)

      visit admin_items_path

      expect(page).to have_content 'Picture'
      expect(page).to have_content 'Name'
      expect(page).to have_content 'Description'
      expect(page).to have_content 'Status'
      expect(page).to have_link 'Edit'

      @items.each do |item|
        expect(page).to have_content item.name
        expect(page).to have_content item.description
        expect(page).to have_content item.status
      end
    end
  end
end