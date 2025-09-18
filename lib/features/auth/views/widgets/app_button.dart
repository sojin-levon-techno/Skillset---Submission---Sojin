import 'package:flutter/material.dart';
import 'package:skilltest/core/colors/colors.dart';
import 'package:skilltest/core/extension/textstyle.dart';

class AppButton extends StatelessWidget {
  final String? name;
  final Function()? onPressed;
  const AppButton({super.key, this.name, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: kPrimary,
        ),
        child: Center(
          child: Text(
            name ?? "",
            style: context.bodyLarge.copyWith(
              fontWeight: FontWeight.bold,
              color: kWhite,
            ),
          ),
        ),
      ),
    );
  }
}
