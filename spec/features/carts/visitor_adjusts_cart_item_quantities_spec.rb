=begin 
As a visitor
When I visit "/cart"
Then I should see my item with a quantity of 1
And when I increase the quantity
Then my current page should be '/cart'
And that item's quantity should reflect the increase
And the subtotal for that item should increase
And the total for the cart should match that increase
And when I decrease the quantity
Then my current page should be '/cart'
And that item's quantity should reflect the decrease
And the subtotal for that item should decrease
And the total for the cart should match that decrease
=end

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
        click_on 'Update Quantity'

        expect(current_path).to eq cart_path
        expect(page).to have_content @item.name
        expect(find_field('Quantity').value).to eq '2'
      end
      expect(page).to have_content "Subtotal: $#{@item.price_per_unit * 2}"
      new_total = (@item.price_per_unit * 2 + @item2.price_per_unit).round(2)
      expect(page).to have_content "Total Price: $#{new_total}"
      expect(old_total).to_not eq new_total
    end

    xscenario 'increases an item\'s quantity by three' do
    end

    xscenario 'decreases an item\'s quantity by one' do
    end

    xscenario 'decreases an item\'s quantity by two' do
    end
  end
end