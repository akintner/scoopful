require 'rails_helper'

RSpec.describe Item, type: :model do
  
  context 'validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_uniqueness_of :name }
    it { is_expected.to validate_presence_of :description }
    it { is_expected.to validate_presence_of :image }
    it { is_expected.to validate_presence_of :price_per_unit }
  end

  context 'associations' do
    it { should belong_to :category }
    # it { should have_many :order_items }
    # it { should have_many :orders }
  end

  it 'can be created as active' do
    item = create(:item)

    expect(item.status).to eq('active')
    expect(item.active?).to be_truthy
  end

  it 'can be created as retired' do
    item = create(:item, status: :retired)

    expect(item.status).to eq('retired')
    expect(item.retired?).to be_truthy
  end
end


