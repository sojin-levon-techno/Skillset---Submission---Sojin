import 'package:flutter/material.dart';
import 'package:skilltest/core/colors/colors.dart';
import 'package:skilltest/core/extension/textstyle.dart';

class WishListLoadingWidget extends StatelessWidget {
  const WishListLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(color: kPrimary, strokeWidth: 3),
          const SizedBox(height: 16),
          Text(
            "Loading your wishlist...",
            style: context.bodyMedium.copyWith(color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }
}
