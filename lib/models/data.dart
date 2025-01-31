import 'category.dart';
import 'product.dart';


List<Category> categories = [
  Category(name: 'Fruits', imageUrl: 'lib/images/fruitz.jpg'),
  Category(name: 'Vegetables', imageUrl: 'lib/images/fruitsvegetable.jpg'),
  Category(name: 'Meat & Fish', imageUrl: 'lib/images/meatfish.jpg'),
  Category(name: 'Dairy', imageUrl: 'lib/images/diary.jpg'),
  Category(name: 'Bakery', imageUrl: 'lib/images/bakeryy.jpg'),
  Category(name: 'Beverages', imageUrl: 'lib/images/beverages.jpg'),
  
];


List<Product> products = [
  Product(
    name: 'Yorghurt\n1Peice', 
    imageUrl: 'lib/images/yoghurt.jpg', 
    price: 150, 
    category: 'Dairy',
    description: 'A healthy yoghurt, perfect for breakfast or as a snack.',
  ),
  Product(
    name: 'Milk\n200ml', 
    imageUrl: 'lib/images/milk.jpg', 
    price: 600, 
    category: 'Dairy',
    description: 'Fresh cow milk rich in calcium and vitamins.',
  ),

  
  Product(
    name: 'Butter\n300g', 
    imageUrl: 'lib/images/butter.jpg', 
    price: 150, 
    category: 'Dairy',
    description: 'Rich butter ideal for baking and spreading on toast.',
  ),
  
  Product(
    name: 'Ice Cream\n500ml', 
    imageUrl: 'lib/images/icecream.jpg', 
    price: 300, 
    category: 'Dairy',
    description: 'Delicious vanilla ice cream, great for any occasion.',
  ),
  Product(
    name: 'Red Apple\n1Peice', 
    imageUrl: 'lib/images/red.jpg', 
    price: 200, 
    category: 'Fruits',
    description: 'Crispy and sweet red apple, perfect for snacking.',
  ),
  Product(
    name: 'RedBellpepper\n100g', 
    imageUrl: 'lib/images/redbell.jpg', 
    price: 150, 
    category: 'Vegetables',
    description: 'Fresh red bell pepper, great for cooking and salads.',
  ),
  Product(
    name: 'Banana\n1Kg', 
    imageUrl: 'lib/images/banana.jpg', 
    price: 350, 
    category: 'Fruits',
    description: 'Ripe bananas, perfect for a healthy snack.',
  ),

    Product(
    name: 'Papaya\n1Kg', 
    imageUrl: 'lib/images/papaya.jpeg', 
    price: 350, 
    category: 'Fruits',
    description: 'Ripe Papaya, perfect for a healthy snack.',
  ),
  Product(
    name: 'Carrot\n250g', 
    imageUrl: 'lib/images/carrots.jpg', 
    price: 130, 
    category: 'Vegetables',
    description: 'Fresh carrots, packed with vitamins and perfect for salads.',
  ),
  Product(
    name: 'Orange\n1peice', 
    imageUrl: 'lib/images/orangi.jpg', 
    price: 200, 
    category: 'Fruits',
    description: 'Juicy orange, rich in vitamin C.',
  ),
  Product(
    name: 'Ginger\n(250g))', 
    imageUrl: 'lib/images/gingerr.jpg', 
    price: 250, 
    category: 'Vegetables',
    description: 'aromatic and fiery spice has been a signature ingredient in Asian cuisine since ancient times.',
  ),
  Product(
    name: 'Cabbage\n250g', 
    imageUrl: 'lib/images/cabbage.jpg', 
    price: 100, 
    category: 'Vegetables',
    description: 'Fresh cabbage, ideal for cooking and salads.',
  ),
  Product(
    name: 'Ribeye Steak\n1Kg', 
    imageUrl: 'lib/images/ribeye.jpg', 
    price: 500, 
    category: 'Meat & Fish',
    description: 'Tender ribeye steak, perfect for grilling or frying.',
  ),
  Product(
    name: 'Chicken\n1Kg', 
    imageUrl: 'lib/images/chicken.jpg', 
    price: 400, 
    category: 'Meat & Fish',
    description: 'Fresh chicken, perfect for a variety of dishes.',
  ),
  Product(
    name: 'Duck\n1Kg', 
    imageUrl: 'lib/images/duck.jpg', 
    price: 600, 
    category: 'Meat & Fish',
    description: 'Delicious duck meat, great for special occasions.',
  ),
  Product(
    name: 'Fish\n1Kg', 
    imageUrl: 'lib/images/fish.jpg', 
    price: 350, 
    category: 'Meat & Fish',
    description: 'Fresh fish, perfect for frying or grilling.',
  ),
  Product(
    name: 'Turkey\n1Kg', 
    imageUrl: 'lib/images/turkey.jpg', 
    price: 500, 
    category: 'Meat & Fish',
    description: 'Tender turkey meat, perfect for roasting.',
  ),
  Product(
    name: 'Prawn\n500g', 
    imageUrl: 'lib/images/prawn.jpg', 
    price: 400, 
    category: 'Meat & Fish',
    description: 'Fresh prawns, perfect for seafood lovers.',
  ),
  Product(
    name: 'Prima Bread\n25 Slice', 
    imageUrl: 'lib/images/bread.jpg', 
    price: 250, 
    category: 'Bakery',
    description: 'Soft white bread, perfect for sandwiches.',
  ),
  Product(
    name: 'Choclate Cake\n1kg', 
    imageUrl: 'lib/images/cake.jpeg', 
    price: 800, 
    category: 'Bakery',
    description: 'Delicious chocolate cake, perfect for dessert.',
  ),
  Product(
    name: 'Donuts\n5Peice', 
    imageUrl: 'lib/images/donuts.jpg', 
    price: 400, 
    category: 'Bakery',
    description: 'Sweet donuts, perfect for a treat.',
  ),
  Product(
    name: 'Frozen Pizza\n12Slice', 
    imageUrl: 'lib/images/pizza.jpg', 
    price: 750, 
    category: 'Bakery',
    description: 'Delicious frozen pizza, perfect for a quick meal.',
  ),
  Product(
    name: 'Cookies\n5Peice', 
    imageUrl: 'lib/images/cookies.jpg', 
    price: 350, 
    category: 'Bakery',
    description: 'Crunchy cookies, perfect with tea or coffee.',
  ),
  Product(
    name: 'Burger Bun\n1pack', 
    imageUrl: 'lib/images/bun.jpg', 
    price: 150, 
    category: 'Bakery',
    description: 'Soft burger buns, perfect for burgers and sandwiches.',
  ),
  Product(
    name: 'Pepsi\n250ml', 
    imageUrl: 'lib/images/pepsii.jpg', 
    price: 200, 
    category: 'Beverages',
    description: 'Refreshing Pepsi, perfect for quenching thirst.',
  ),
  Product(
    name: 'MountainDew\n250ml', 
    imageUrl: 'lib/images/mountains.jpg', 
    price: 250, 
    category: 'Beverages',
    description: 'Refreshing Mountain Dew, full of energy.',
  ),
  Product(
    name: 'Fanta\n250ml', 
    imageUrl: 'lib/images/fanta.jpg', 
    price: 200, 
    category: 'Beverages',
    description: 'Orange-flavored Fanta, perfect for a refreshing drink.',
  ),
  Product(
    name: 'Sprite\n250ml', 
    imageUrl: 'lib/images/sprites.jpg', 
    price: 230, 
    category: 'Beverages',
    description: 'Lemon-lime flavored Sprite, great for refreshment.',
  ),
];

