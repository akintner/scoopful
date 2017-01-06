coffees = Category.create(title: 'Coffees')
nuts = Category.create(title: 'Nuts')
spices = Category.create(title: 'Spices')

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

nuts.items.create(
  name: 'Pistachios',
  description: 'Sweet with a salty aftertaste.',
  price_per_unit: 6.13,
  image: Rack::Test::UploadedFile.new(File.join(Rails.root, 'db', 'images', 'pistachios.png'))
)

nuts.items.create(
  name: 'Brazil Nuts',
  description: 'A creamy texture and sweet taste.',
  price_per_unit: 5.99,
  image: Rack::Test::UploadedFile.new(File.join(Rails.root, 'db', 'images', 'brazil-nuts.png')),
  status: :retired
)

coffees.items.create(
  name: 'Colombian',
  description: 'Mild, balanced beans.',
  price_per_unit: 5.72,
  image: Rack::Test::UploadedFile.new(File.join(Rails.root, 'db', 'images', 'colombian.png'))
)

coffees.items.create(
  name: 'Caturra',
  description: 'Bright acidity and low-to-medium body.',
  price_per_unit: 8.27,
  image: Rack::Test::UploadedFile.new(File.join(Rails.root, 'db', 'images', 'caturra.png'))
)

coffees.items.create(
  name: 'Arusha',
  description: 'Citrus, nutty bean from Tanzania.',
  price_per_unit: 13.10,
  image: Rack::Test::UploadedFile.new(File.join(Rails.root, 'db', 'images', 'arusha.png'))
)

spices.items.create(
  name: 'Salt',
  description: 'No kitchen is complete without salt.',
  price_per_unit: 2.50,
  image: Rack::Test::UploadedFile.new(File.join(Rails.root, 'db', 'images', 'salt.png'))
)

spices.items.create(
  name: 'Chili Powder',
  description: 'Dried ground chili peppers, cumin, garlic and oregano',
  price_per_unit: 6.62,
  image: Rack::Test::UploadedFile.new(File.join(Rails.root, 'db', 'images', 'chili-powder.png'))
)

spices.items.create(
  name: 'Cinnamon',
  description: 'Condiment and flavoring for sweet and savory foods.',
  price_per_unit: 7.20,
  image: Rack::Test::UploadedFile.new(File.join(Rails.root, 'db', 'images', 'cinnamon.png'))
)