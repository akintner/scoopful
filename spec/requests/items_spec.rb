require 'rails_helper'

describe "Items API" do
  it "sends a list of items" do
    create_list(:item, 3)
    get api_v1_items_path

    expect(response).to be_success
    items = JSON.parse(response.body)
    expect(items.count).to eq(3)
  end

  it "sends the most popular item by quantity" do
    item1, item2 = create_list(:item, 2)
    order = create(:order)
    order.checkout({item1.id.to_s => 2, item2.id.to_s => 1})
    get api_v1_most_popular_path

    most_popular = JSON.parse(response.body)
    expect(most_popular['id']).to eq(item1.id)
  end

end