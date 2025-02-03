import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/cart.dart';
import '../models/cart_item.dart';

class ProductDetailScreen extends StatefulWidget {
  final String productName;
  final String productImage; // <-- This is a network URL from product.imageUrl
  final double productPrice;
  final String productDescription;

  ProductDetailScreen({
    required this.productName,
    required this.productImage,
    required this.productPrice,
    required this.productDescription,
  });

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int _quantity = 1;

  void _incrementQuantity() {
    setState(() {
      _quantity++;
    });
  }

  void _decrementQuantity() {
    if (_quantity > 1) {
      setState(() {
        _quantity--;
      });
    }
  }

  void _addToCart() {
    Cart.addItem(
      CartItem(
        name: widget.productName,
        imageUrl: widget.productImage,
        price: widget.productPrice,
        quantity: _quantity,
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${widget.productName} added to cart!'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.productName),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Use Image.network to load from a URL
            Center(
              child: Image.network(
                widget.productImage,
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
                // Provide error and loading handling:
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey,
                    height: 250,
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: const Icon(Icons.error, color: Colors.red, size: 40),
                  );
                },
                loadingBuilder: (context, child, progress) {
                  if (progress == null) return child;
                  return Container(
                    height: 250,
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator(),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),

            // Product Name
            Text(
              widget.productName,
              style: GoogleFonts.roboto(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).textTheme.bodyLarge?.color,
              ),
            ),
            const SizedBox(height: 10),

            // Product Price
            Text(
              "Rs ${widget.productPrice.toStringAsFixed(0)}",
              style: GoogleFonts.roboto(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 20),

            // Quantity Adjust
            Row(
              children: [
                IconButton(
                  onPressed: _decrementQuantity,
                  icon: const Icon(Icons.remove_circle_outline, color: Colors.green),
                ),
                Text(
                  '$_quantity',
                  style: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                  ),
                ),
                IconButton(
                  onPressed: _incrementQuantity,
                  icon: const Icon(Icons.add_circle_outline, color: Colors.green),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Product Details
            ExpansionTile(
              title: Text(
                'Product Details',
                style: GoogleFonts.roboto(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.productDescription,
                    style: TextStyle(color: Theme.of(context).textTheme.bodyLarge?.color),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Fake Reviews
            Row(
              children: [
                Text(
                  'Reviews',
                  style: GoogleFonts.roboto(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                  ),
                ),
                const SizedBox(width: 10),
                const Icon(Icons.star, color: Colors.orange),
                const Icon(Icons.star, color: Colors.orange),
                const Icon(Icons.star, color: Colors.orange),
                const Icon(Icons.star, color: Colors.orange),
                const Icon(Icons.star_half, color: Colors.orange),
              ],
            ),
            const SizedBox(height: 20),

            // Add to Cart Button
            Center(
              child: ElevatedButton(
                onPressed: _addToCart,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Add to Cart',
                  style: GoogleFonts.roboto(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
