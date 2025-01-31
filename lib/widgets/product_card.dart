import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart'; 
import '../models/cart.dart'; 
import '../models/cart_item.dart'; 

class ProductCardWidget extends StatelessWidget {
  final String productName;
  final String productImage;
  final double productPrice;

  ProductCardWidget({
    required this.productName,
    required this.productImage,
    required this.productPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        width: 160,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor, 
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).shadowColor.withOpacity(0.1), 
              blurRadius: 5,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 120,
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                child: Image.asset(
                  productImage,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            SizedBox(height: 8),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                productName,
                style: GoogleFonts.roboto(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).textTheme.bodyLarge?.color, 
                ),
              ),
            ),
            SizedBox(height: 5),

            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    NumberFormat.currency(locale: 'en_LK', symbol: 'Rs ', decimalDigits: 0).format(productPrice),
                    style: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).textTheme.bodyLarge?.color, 
                    ),
                  ),

                  IconButton(
                    icon: Icon(Icons.add_circle, color: Theme.of(context).iconTheme.color), 
                    iconSize: 35,
                    onPressed: () {
                      final cartItem = CartItem(
                        name: productName,
                        imageUrl: productImage,
                        price: productPrice,
                        quantity: 1,
                      );

                      
                      Cart.addItem(cartItem);

                      
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Added to cart!')),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
