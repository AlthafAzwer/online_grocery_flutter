import 'package:flutter/material.dart';
import '../models/product.dart'; 
import '../widgets/category_card.dart'; 
import '../widgets/product_card.dart'; 
import '../models/data.dart'; 
import 'product_detail_screen.dart'; 

class ProductListScreen extends StatefulWidget {
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  String selectedCategory = 'Fruits'; 

  
  List<Product> _filterProductsByCategory(String category) {
    return products.where((product) => product.category == category).toList();
  }

  @override
  Widget build(BuildContext context) {
    List<Product> filteredProducts = _filterProductsByCategory(selectedCategory);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor, 
      body: SingleChildScrollView(
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

          
            Container(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: categories.map((category) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCategory = category.name;
                      });
                    },
                    child: CategoryCard(category: category), 
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 10),

            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(), 
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, 
                  childAspectRatio: 0.7, 
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: filteredProducts.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailScreen(
                            productName: filteredProducts[index].name,
                            productImage: filteredProducts[index].imageUrl,
                            productPrice: filteredProducts[index].price,
                            productDescription: filteredProducts[index].description, 
                          ),
                        ),
                      );
                    },
                    child: ProductCardWidget(
                      productName: filteredProducts[index].name,
                      productImage: filteredProducts[index].imageUrl,
                      productPrice: filteredProducts[index].price,
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
