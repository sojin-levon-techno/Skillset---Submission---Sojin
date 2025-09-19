import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:skilltest/core/colors/colors.dart';
import 'package:skilltest/core/extension/mediaquery.dart';

class OTPFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final int? length;
  const OTPFieldWidget({super.key, required this.controller, this.length});

  @override
  Widget build(BuildContext context) {
    return Pinput(
      controller: controller,
      autofocus: true,
      showCursor: false,
      length: length ?? 4,
      closeKeyboardWhenCompleted: true,
      defaultPinTheme: PinTheme(
        height: context.height * 0.07,
        width: context.width * 0.15,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 244, 244, 244),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color.fromARGB(255, 244, 244, 244)),
        ),
      ),
      focusedPinTheme: PinTheme(
        height: context.height * 0.07,
        width: context.width * 0.15,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 2, color: kPrimary),
        ),
      ),
    );
  }
}
