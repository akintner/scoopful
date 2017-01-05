require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'validations' do
      it { should validate_presence_of(:title) }
      it { should validate_uniqueness_of(:title) }
  end

  it 'makes pretty params' do
    category = create(:category, title: '1 Title')
    expect(category.to_param).to eq("1-title")
  end

  it 'finds by parameterized name' do
    category = create(:category, title: '1 Title')
    found_title = Category.where_by_param(category.to_param).first.title
    expect(found_title).to eq(category.title)
  end

  it 'formats titles correctly' do
    expect(Category.format('3-title')).to eq('3 Title')
  end
end