require 'rails_helper'

describe "Items API" do
  it "sends a list of items" do
    create_list(:item, 3)
    get api_v1_items_path

    expect(response).to be_success
    items = JSON.parse(response.body)
    expect(items.count).to eq(3)
  end

end