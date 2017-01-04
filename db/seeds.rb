coffees = Category.create(title: 'Coffees')
nuts = Category.create(title: 'Nuts')

nuts.items.create(
  name: 'Almonds',
  description: "Humankind's most beloved nut.",
  price_per_unit: 5.38,
  image: Rack::Test::UploadedFile.new(File.join(Rails.root, 'db', 'images', 'almonds.png'))
)

nuts.items.create(
  name: 'Walnuts',
  description: 'Nutrient-dense with protein and essential fatty acids.',
  price_per_unit: 4.21,
  image: Rack::Test::UploadedFile.new(File.join(Rails.root, 'db', 'images', 'walnuts.png'))
)

coffees.items.create(
  name: 'Colombian',
  description: 'Mild, balanced beans.',
  price_per_unit: 1.72,
  image: Rack::Test::UploadedFile.new(File.join(Rails.root, 'db', 'images', 'colombian.png'))
)

coffees.items.create(
  name: 'Caturra',
  description: 'Bright acidity and low-to-medium body.',
  price_per_unit: 6.27,
  image: Rack::Test::UploadedFile.new(File.join(Rails.root, 'db', 'images', 'caturra.png'))
)