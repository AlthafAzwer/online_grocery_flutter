import 'package:flutter/material.dart';
import 'profile_screen.dart';
import '../widgets/banner_widget.dart'; 
import '../widgets/category_header_widget.dart'; 
import '../widgets/product_card.dart'; 
import 'product_list_screen.dart'; 
import 'product_detail_screen.dart'; 
import 'cart_screen.dart'; 


class HomeScreen extends StatefulWidget {
  final ValueNotifier<ThemeMode> themeNotifier; 

  HomeScreen({required this.themeNotifier});

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
      HomeContentWidget(), 
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


class HomeContentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10), 
          Center(
            child: Image.asset(
              'lib/images/logofinal.png', 
              height: 140, 
              width: 140,  
            ),
          ),
          SizedBox(height: 2), 
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.location_on, color: Colors.grey, size: 18),
              SizedBox(width: 10),
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
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: BannerWidget(),
          ),
          SizedBox(height: 10),

          
          CategoryHeaderWidget(
            title: "Exclusive Offers",
            onSeeAllPressed: () {
            },
          ),
          SizedBox(height: 10),

          
          Container(
            height: 240, 
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailScreen(
                          productName: "Red Apple \n(1 piece)",
                          productImage: 'lib/images/red.jpg',
                          productPrice: 200,
                          productDescription: "Apples are nutritious. They may be good for weight loss and heart health.",
                        ),
                      ),
                    );
                  },
                  child: ProductCardWidget(
                    productName: "Red Apple \n(1 piece)",
                    productImage: 'lib/images/red.jpg',
                    productPrice: 200,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailScreen(
                          productName: "Ginger \n(250g)",
                          productImage: 'lib/images/gingerr.jpg',
                          productPrice: 250,
                          productDescription: "Ginger can help relieve nausea and may help with inflammation.",
                        ),
                      ),
                    );
                  },
                  child: ProductCardWidget(
                    productName: "Ginger \n(250g)",
                    productImage: 'lib/images/gingerr.jpg',
                    productPrice: 250,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailScreen(
                          productName: "Red Pepper (100g)",
                          productImage: 'lib/images/redbell.jpg',
                          productPrice: 120,
                          productDescription: "Red peppers are packed with vitamin C and support immune health.",
                        ),
                      ),
                    );
                  },
                  child: ProductCardWidget(
                    productName: "Red Pepper (100g)",
                    productImage: 'lib/images/redbell.jpg',
                    productPrice: 120,
                  ),
                ),
              ],
            ),
          ),

          
          CategoryHeaderWidget(
            title: "Best Selling",
            onSeeAllPressed: () {
            },
          ),
          SizedBox(height: 10),

          Container(
            height: 240, 
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailScreen(
                          productName: "Basmathi Rice\n(1kg)",
                          productImage: 'lib/images/rise.jpg',
                          productPrice: 350,
                          productDescription: "Basmathi rice is fragrant and perfect for a variety of dishes.",
                        ),
                      ),
                    );
                  },
                  child: ProductCardWidget(
                    productName: "Basmathi Rice\n(1kg)",
                    productImage: 'lib/images/rise.jpg',
                    productPrice: 350,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailScreen(
                          productName: "Pepsi\n(250ml)",
                          productImage: 'lib/images/pepsii.jpg',
                          productPrice: 200,
                          productDescription: "Enjoy the refreshing taste of Pepsi.",
                        ),
                      ),
                    );
                  },
                  child: ProductCardWidget(
                    productName: "Pepsi\n(250ml)",
                    productImage: 'lib/images/pepsii.jpg',
                    productPrice: 200,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailScreen(
                          productName: "Bananas\n(1kg)",
                          productImage: 'lib/images/banana.jpg',
                          productPrice: 350,
                          productDescription: "Bananas are rich in potassium and make for a healthy snack.",
                        ),
                      ),
                    );
                  },
                  child: ProductCardWidget(
                    productName: "Bananas\n(1kg)",
                    productImage: 'lib/images/banana.jpg',
                    productPrice: 350,
                  ),
                ),
              ],
            ),
          ),

          
          CategoryHeaderWidget(
            title: "Popular Meat",
            onSeeAllPressed: () {
            },
          ),
          SizedBox(height: 10),

          
          Container(
            height: 240, 
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailScreen(
                          productName: "Ribeye Steak\n(1kg)",
                          productImage: 'lib/images/ribeye.jpg',
                          productPrice: 500,
                          productDescription: "Ribeye Steak is tender, juicy, and perfect for grilling.",
                        ),
                      ),
                    );
                  },
                  child: ProductCardWidget(
                    productName: "Ribeye Steak\n(1kg)",
                    productImage: 'lib/images/ribeye.jpg',
                    productPrice: 500,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailScreen(
                          productName: "Broiler Chicken\n(1kg)",
                          productImage: 'lib/images/chicken.jpg',
                          productPrice: 400,
                          productDescription: "Broiler Chicken is a high-quality protein that works for various recipes.",
                        ),
                      ),
                    );
                  },
                  child: ProductCardWidget(
                    productName: "Broiler Chicken\n(1kg)",
                    productImage: 'lib/images/chicken.jpg',
                    productPrice: 400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
