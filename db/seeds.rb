coffees = Category.create(title: 'Coffees')
nuts = Category.create(title: 'Nuts')

almonds = nuts.items.create(
  name: "Almonds",
  description: "The almond that we think of as a nut is technically the seed of the fruit of the almond tree, a medium-size tree that bears fragrant pink and white flowers. Like its cousins, the peach, cherry and apricot trees, the almond tree bears fruits with stone-like seeds (or pits) within.",
  price_per_unit: 5.38,
  image: Rack::Test::UploadedFile.new(File.join(Rails.root, 'images', 'almonds.png'))
)

walnuts = nuts.items.create(
  name: "Walnuts",
  description: "A walnut is the nut of any tree of the genus Juglans (Family Juglandaceae), particularly the Persian or English walnut, Juglans regia. Technically a walnut is the seed of a drupe or drupaceous nut, and thus not a true botanical nut. The walnut is nutrient-dense with protein and essential fatty acids.",
  price_per_unit: 4.21,
  image: Rack::Test::UploadedFile.new(File.join(Rails.root, 'images', 'walnuts.png'))
)

colombian = coffees.items.create(
  name: "Colombian",
  description: "Colombian coffee is often regarded as some of the highest quality coffee in the world. Colombia has traditionally grown arabica beans and its unique geography makes it perfectly suited for producing a high quality brew. Coffee production in Colombia has a reputation as producing mild, balanced beans.",
  price_per_unit: 1.72,
  image: Rack::Test::UploadedFile.new(File.join(Rails.root, 'images', 'colombian.png'))
)

caturra = coffees.items.create(
  name: "Caturra",
  description: "Caturra is distinguished by its bright acidity and low-to-medium body. It has less clarity and sweetness than its parent, Bourbon. Also known as Variedad Colombia, you’ll taste the classic caramel and chocolate with hints of cherry in the sweet, bright, full-bodied bean.",
  price_per_unit: 6.27,
  image: Rack::Test::UploadedFile.new(File.join(Rails.root, 'images', 'caturra.png'))
)

