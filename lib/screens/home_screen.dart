import 'package:flutter/material.dart';

// Screens & Widgets
import 'profile_screen.dart'; // Contains AccountScreen
import '../widgets/banner_widget.dart';
import '../widgets/category_header_widget.dart';
import '../widgets/product_card.dart';
import 'product_list_screen.dart';
import 'product_detail_screen.dart';
import 'cart_screen.dart';

// Models & Services
import '../models/product.dart';
import '../services/api_service.dart';

class HomeScreen extends StatefulWidget {
  final ValueNotifier<ThemeMode> themeNotifier;

  const HomeScreen({Key? key, required this.themeNotifier}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  int _selectedIndex = 0;
  late AnimationController _controller;
  late Animation<double> _animation;
  late final List<Widget> _widgetOptions;

  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
      const HomeContentWidget(),
      ProductListScreen(),
      CartScreen(),
      AccountScreen(themeNotifier: widget.themeNotifier),
    ];

    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _controller.forward();
  }

  void _onItemTapped(int index) {
    if (_selectedIndex != index) {
      _controller.reverse().then((_) {
        setState(() {
          _selectedIndex = index;
        });
        _controller.forward();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: FadeTransition(
        opacity: _animation,
        child: _widgetOptions[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Products',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Theme.of(context).iconTheme.color,
        onTap: _onItemTapped,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class HomeContentWidget extends StatefulWidget {
  const HomeContentWidget({Key? key}) : super(key: key);

  @override
  _HomeContentWidgetState createState() => _HomeContentWidgetState();
}

class _HomeContentWidgetState extends State<HomeContentWidget> {
  final ApiService _apiService = ApiService();

  bool isLoading = true;
  List<Product> _allProducts = [];

  // Sub-lists for each section
  List<Product> _exclusiveOffers = [];
  List<Product> _bestSelling = [];
  List<Product> _popularMeat = [];

  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

  Future<void> _fetchProducts() async {
    try {
      final products = await _apiService.fetchProducts();
      setState(() {
        _allProducts = products;
        isLoading = false;
      });
      _filterProducts();
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print('Error fetching products: $e');
    }
  }

  void _filterProducts() {
    // Adjust as needed to match your categories
    _exclusiveOffers = _allProducts.where((p) => p.category.toLowerCase() == 'fruit').toList();
    _bestSelling = _allProducts.where((p) => p.category.toLowerCase() == 'bakery').toList();
    _popularMeat = _allProducts.where((p) => p.category.toLowerCase() == 'meat').toList();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return ListView(
      children: [
        const SizedBox(height: 10),
        // Logo
        Center(
          child: Image.asset(
            'lib/images/logofinal.png',
            height: 140,
            width: 140,
          ),
        ),
        const SizedBox(height: 2),

        // Location
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.location_on, color: Colors.grey, size: 18),
            const SizedBox(width: 10),
            Text(
              'Colombo 15, SriLanka',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).textTheme.bodyLarge?.color,
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),

        // Banner
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: BannerWidget(),
        ),
        const SizedBox(height: 10),

        // 1) EXCLUSIVE OFFERS
        CategoryHeaderWidget(
          title: "Exclusive Offers",
          onSeeAllPressed: () {},
        ),
        const SizedBox(height: 10),
        _buildHorizontalList(_exclusiveOffers),
        const SizedBox(height: 20),

        // 2) BEST SELLING
        CategoryHeaderWidget(
          title: "Best Selling",
          onSeeAllPressed: () {},
        ),
        const SizedBox(height: 10),
        _buildHorizontalList(_bestSelling),
        const SizedBox(height: 20),

        // 3) POPULAR MEAT
        CategoryHeaderWidget(
          title: "Popular Meat",
          onSeeAllPressed: () {},
        ),
        const SizedBox(height: 10),
        _buildHorizontalList(_popularMeat),
        const SizedBox(height: 20),
      ],
    );
  }

  /// Builds a horizontal list of products
  Widget _buildHorizontalList(List<Product> products) {
    return SizedBox(
      height: 240, // Ensures a consistent height
      child: products.isEmpty
          ? Center(
              child: Text(
                'No products found.',
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                ),
              ),
            )
          : ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return GestureDetector(
                  onTap: () {
                    // Navigate to detail screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailScreen(
                          productName: product.name,
                          productImage: product.imageUrl,
                          productPrice: product.price,
                          productDescription: product.description,
                        ),
                      ),
                    );
                  },
                  child: ProductCardWidget(
                    productName: product.name,
                    productImage: product.imageUrl,
                    productPrice: product.price,
                  ),
                );
              },
            ),
    );
  }
}
