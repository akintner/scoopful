require 'rails_helper'

RSpec.describe Cart, type: :model do
  before do
    @cart = Cart.new({})
    @items = create_list(:item, 3)
  end

  it "adds an item to its contents" do
    expect(@cart.contents.empty?).to be_truthy

    @cart.add_item(1)

    expect(@cart.contents.empty?).to be_falsy
    expect(@cart.contents.count).to eq 1
  end

  it "adds many of one item if quantity is specified" do
    expect(@cart.contents.empty?).to be_truthy

    @cart.add_item(1, 3)

    expect(@cart.contents.empty?).to be_falsy
    expect(@cart.contents.values.first).to eq 3
  end

  it "counts all the items it has" do
    expect(@cart.total_count).to eq 0

    @cart.add_item(2)
    @cart.add_item(5)
    @cart.add_item(5)
    @cart.add_item(3)

    expect(@cart.total_count).to eq 4
  end

  it "counts the amount of an item" do
    @cart.add_item(1)
    @cart.add_item(1)
    expect(@cart.count_of(1)).to eq 2
  end

  it "returns an active record collection of all items" do
    @items.each { |item| @cart.add_item(item.id) }

    expect(@cart.items.class.to_s).to eq "Item::ActiveRecord_Relation"
    expect(@cart.items.count).to eq 3
  end

  it "calculates the total price of all items" do
    @items.each { |item| @cart.add_item(item.id) }
    @cart.add_item(@items.first.id)

    total = @items.map(&:price_per_unit).sum.round(2) + @items.first.price_per_unit
    expect(@cart.total_price).to eq total
  end

  it "removes a single item from cart" do
    @cart.add_item(@items.first.id)

    @cart.remove(@items.first.id)

    expect(@cart.total_count).to eq 0
  end

  it "removes all items of type from cart" do
    @cart.add_item(@items.first.id, 2)
    @cart.add_item(@items.last.id)

    @cart.remove(@items.first.id)

    expect(@cart.total_count).to eq 1
  end
end