require 'rails_helper'

RSpec.describe Cart, type: :model do
  it "adds an item to its contents" do
    backpack = Backpack.new
    expect(backpack.total_count).to eq 0

    backpack.add_item(2)

    expect(backpack.total_count).to eq 1
  end
end