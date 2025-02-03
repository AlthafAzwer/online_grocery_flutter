import 'package:flutter/material.dart';
import '../models/product.dart';
import '../services/api_service.dart';
import '../widgets/category_card.dart';
import '../widgets/product_card.dart';
import 'product_detail_screen.dart';

// If you still want to use a hardcoded categories list (you can update these to match your API)
import '../models/data.dart'; // Assuming this contains a List<Category> categories

class ProductListScreen extends StatefulWidget {
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final ApiService _apiService = ApiService();

  // List to hold all products fetched from the API
  List<Product> _allProducts = [];

  // Filtered products based on the selected category
  List<Product> _filteredProducts = [];

  // Default selected category – update this to match the categories from your API!
  String selectedCategory = 'Fruit';

  // Loading indicator flag
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchProductsFromApi();
  }

  /// Fetch products from the Laravel API
  void _fetchProductsFromApi() async {
    try {
      List<Product> products = await _apiService.fetchProducts();
      setState(() {
        _allProducts = products;
        _filteredProducts = _filterProductsByCategory(selectedCategory);
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print('Error fetching products: $e');
      // Optionally show a SnackBar or error message here.
    }
  }

  /// Filter products by the selected category
  List<Product> _filterProductsByCategory(String category) {
    return _allProducts.where((product) => product.category.toLowerCase() == category.toLowerCase()).toList();
  }

  /// Called when a category is tapped in the horizontal list.
  void _onCategorySelected(String category) {
    setState(() {
      selectedCategory = category;
      _filteredProducts = _filterProductsByCategory(category);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30),
                  Center(
                    child: Image.asset(
                      'lib/images/logofinal.png',
                      height: 100,
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'Category',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).textTheme.bodyLarge?.color,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  // Horizontal list of categories
                  Container(
                    height: 100,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: categories.map((category) {
                        return GestureDetector(
                          onTap: () => _onCategorySelected(category.name),
                          child: CategoryCard(category: category),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(height: 10),
                  // Display filtered products in a grid
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.7,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: _filteredProducts.length,
                      itemBuilder: (context, index) {
                        final product = _filteredProducts[index];
                        return GestureDetector(
                          onTap: () {
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
                  ),
                ],
              ),
            ),
    );
  }
}
