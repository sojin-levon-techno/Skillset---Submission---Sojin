import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:skilltest/core/constants/constants.dart';

class BannerLoadingWidget extends StatelessWidget {
  const BannerLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: Padding(
        padding: kPadding16,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            height: 120,
            width: double.infinity,
            color: Colors.grey[300],
          ),
        ),
      ),
    );
  }
}
