import 'cart_item.dart';

class Cart {
  static final List<CartItem> _items = [];

  static List<CartItem> get items => _items;

  static void addItem(CartItem item) {
    var existingItem = _items.firstWhere(
      (cartItem) => cartItem.name == item.name,
      orElse: () => CartItem(name: '', imageUrl: '', price: 0),
    );
    
    if (existingItem.name != '') {
      existingItem.quantity++;
    } else {
      _items.add(item);
    }
  }

  static void removeItem(CartItem item) {
    _items.removeWhere((cartItem) => cartItem.name == item.name);
  }

  static double get totalPrice {
    return _items.fold(0, (total, item) => total + (item.price * item.quantity));
  }

  static void clearCart() {
    _items.clear();
  }
}
