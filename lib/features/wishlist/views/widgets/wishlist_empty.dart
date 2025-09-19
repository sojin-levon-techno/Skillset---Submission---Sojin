// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:skilltest/core/colors/colors.dart';
import 'package:skilltest/core/extension/textstyle.dart';

class WishlistEmpty extends StatelessWidget {
  const WishlistEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: kPrimary.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.favorite_border, size: 64, color: kPrimary),
            ),
            const SizedBox(height: 24),
            Text(
              "Your wishlist is empty",
              style: context.titleLarge.copyWith(
                color: kBlack,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Add some products to your wishlist to see them here",
              style: context.bodyMedium.copyWith(color: Colors.grey.shade600),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}