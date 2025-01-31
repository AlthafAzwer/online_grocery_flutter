import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryHeaderWidget extends StatelessWidget {
  final String title;
  final VoidCallback onSeeAllPressed;

  CategoryHeaderWidget({required this.title, required this.onSeeAllPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.roboto(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).textTheme.bodyLarge?.color, 
            ),
          ),
          GestureDetector(
            onTap: onSeeAllPressed,
            child: Text(
              "See all",
              style: GoogleFonts.roboto(
                fontSize: 14,
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
