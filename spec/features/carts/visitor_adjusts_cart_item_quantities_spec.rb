require 'rails_helper'

RSpec.feature do
  before do
    @category = create(:category_with_items)
    @item = @category.items.first
    @item2 = @category.items.last

    visit items_path

    within "section##{@item.name.tr(' ', '-')}" do
      click_button('Add to Cart')
    end
    within "section##{@item2.name.tr(' ', '-')}" do
      click_button('Add to Cart')
    end
  end

  context 'visitor' do
    scenario 'increases an item\'s quantity by one' do
      visit cart_path
      old_total = (@item.price_per_unit + @item2.price_per_unit).round(2)
      expect(page).to have_content "Total Price: $#{old_total}"

      within 'li.cart-item:nth-child(1)' do
        expect(page).to have_content @item.name
        expect(find_field('Quantity').value).to eq '1'

        expect(page).to have_content "Subtotal: $#{@item.price_per_unit}"
        
        fill_in 'quantity', with: '2'
        click_on 'Update'

        expect(current_path).to eq cart_path
        expect(page).to have_content @item.name
        expect(find_field('Quantity').value).to eq '2'
      end

      new_total = (@item.price_per_unit * 2 + @item2.price_per_unit).round(2)
      expect(page).to have_content "Subtotal: $#{@item.price_per_unit * 2}"
      expect(page).to have_content "Total Price: $#{new_total}"
      expect(old_total).to_not eq new_total
    end

    scenario 'increases an item\'s quantity by three' do
      visit cart_path
      old_total = (@item.price_per_unit + @item2.price_per_unit).round(2)

      within 'li.cart-item:nth-child(1)' do
        fill_in 'quantity', with: '4'
        click_on 'Update'

        expect(current_path).to eq cart_path
        expect(page).to have_content @item.name
        expect(find_field('Quantity').value).to eq '4'
      end

      new_total = (@item.price_per_unit * 4 + @item2.price_per_unit).round(2)
      expect(page).to have_content "Subtotal: $#{@item.price_per_unit * 4}"
      expect(page).to have_content "Total Price: $#{new_total}"
      expect(old_total).to_not eq new_total
    end

    scenario 'decreases an item\'s quantity by one' do
      visit cart_path
      old_total = (@item.price_per_unit + @item2.price_per_unit).round(2)

      within 'li.cart-item:nth-child(1)' do
        fill_in 'quantity', with: '0'
        click_on 'Update'

        expect(current_path).to eq cart_path
      end

      new_total = (@item.price_per_unit * 0 + @item2.price_per_unit).round(2)
      expect(page).to have_content "Total Price: $#{new_total}"
      expect(old_total).to_not eq new_total
    end

    scenario 'decreases an item\'s quantity by two' do
      visit items_path
      within "section##{@item.name.tr(' ', '-')}" do
        click_button('Add to Cart')
        click_button('Add to Cart')
        click_button('Add to Cart')
      end

      visit cart_path
      old_total = (@item.price_per_unit * 4 + @item2.price_per_unit).round(2)

      within 'li.cart-item:nth-child(1)' do
        expect(find_field('Quantity').value).to eq '4'
        fill_in 'quantity', with: '1'
        click_on 'Update'

        expect(current_path).to eq cart_path
        expect(page).to have_content @item.name
        expect(find_field('Quantity').value).to eq '1'
      end

      new_total = (@item.price_per_unit * 1 + @item2.price_per_unit).round(2)
      expect(page).to have_content "Subtotal: $#{@item.price_per_unit * 1}"
      expect(page).to have_content "Total Price: $#{new_total}"
      expect(old_total).to_not eq new_total
    end
  end
end