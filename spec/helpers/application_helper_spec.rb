require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  before do
    create(:category_with_items)
    @items = Category.last.items
  end

  it 'can find all categories' do
    expect(categories.class).to eq Category::ActiveRecord_Relation
    expect(categories.count).to eq Category.all.count
  end

  context 'checking item status' do
    it 'checks active item' do
      item = @items.first
      expected = item_status_check(item)
      result = button_to 'Add to Cart', carts_path(item_id: item.id)

      expect(expected).to eq result
    end

    it 'checks retired item' do
      item = @items.first
      item.status = 1
      expected = item_status_check(item)
      result = button_to 'Item Retired', retired_item_path(item_id: item.id)

      expect(expected).to eq result
    end
  end

  it 'formats item price per unit' do
    item = @items.first
    item.price_per_unit = 1.99
    expected = format_price_per_unit(item)

    expect(expected).to eq '$1.99 / lb'
  end

  context 'price for item' do
    it 'calls price per unit on an item' do
      item = @items.first
      expected = price_for(item)

      expect(expected).to be_truthy
    end

    it 'calls current price per unit on an order item' do
      order_item = create(:order_with_items).orders_items.first
      expected = price_for(order_item)

      expect(expected).to be_truthy
    end
  end

  context 'active search' do
    it 'returns true if active' do
      params[:q] = {name_cont: 'a'}
      @q     = Item.ransack(params[:q])
      @items = @q.result(distinct: true)

      expect(active_search?).to be_truthy
    end

    it 'returns false if inactive' do
      @q     = Item.ransack(params[:q])
      @items = @q.result(distinct: true)
      
      expect(active_search?).to be_falsy
    end
  end
end