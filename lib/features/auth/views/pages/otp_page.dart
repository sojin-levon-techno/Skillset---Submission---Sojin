import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skilltest/core/colors/colors.dart';
import 'package:skilltest/core/constants/constants.dart';
import 'package:skilltest/core/extension/navigation.dart';
import 'package:skilltest/core/extension/textstyle.dart';
import 'package:skilltest/features/auth/views/widgets/app_button.dart';
import 'package:skilltest/features/auth/views/widgets/pinput.dart';
import 'package:skilltest/features/bottom_nav/bottom_nav.dart';

class OTPPage extends StatefulWidget {
  final String? phoneNumber;
  const OTPPage({super.key, this.phoneNumber});

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  final _otpController = TextEditingController();
  final _otp = "7530";
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(CupertinoIcons.back),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: kPadding16,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            
              children: [
                const SizedBox(height: 24),
            
                Text(
                  "OTP VERIFICATION",
                  style: context.headLineMedium.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Text.rich(
                  TextSpan(
                    style: context.bodyMedium.copyWith(),
                    children: [
                      TextSpan(text: "Enter the OTP sent to - "),
                      TextSpan(
                        style: context.bodyMedium.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
            
                        text: "${widget.phoneNumber}",
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        style: context.bodyLarge.copyWith(),
            
                        text: "OTP is ",
                      ),
                      TextSpan(
                        style: context.bodyLarge.copyWith(
                          fontWeight: FontWeight.bold,
                          color: kPrimary,
                        ),
            
                        text: _otp,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                OTPFieldWidget(controller: _otpController, length: 4),
                const SizedBox(height: 46),
                AppButton(
                  name: "Submit",
                  onPressed: () {
                    final otp = _otpController.text.trim();
                    if (_otp == otp) {
                      context.pushAndRemoveUntil(page: AppBottomNav());
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: kRed,
                          content: Text(
                            "Invalid OTP!", 
                            style: context.bodyLarge.copyWith(
                              fontWeight: FontWeight.bold,
                              color: kWhite,
                            ),
                          ),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
