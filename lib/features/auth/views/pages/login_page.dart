import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skilltest/core/colors/colors.dart';
import 'package:skilltest/core/constants/constants.dart';
import 'package:skilltest/core/extension/navigation.dart';
import 'package:skilltest/core/extension/textstyle.dart';
import 'package:skilltest/features/auth/bloc/auth_bloc.dart';
import 'package:skilltest/features/auth/views/pages/info_page.dart';
import 'package:skilltest/features/auth/views/pages/otp_page.dart';
import 'package:skilltest/features/auth/views/widgets/app_button.dart';
import 'package:skilltest/features/bottom_nav/bottom_nav.dart';
import 'package:skilltest/features/profile/pages/privacy_policy.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _phoneNumber = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _phoneNumber.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
                  "Login",
                  style: context.headLineMedium.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Welcome Back! Good to see you again.",
                  style: context.bodyLarge.copyWith(color: Colors.grey),
                ),
                const SizedBox(height: 26),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                        readOnly: true,
                        decoration: InputDecoration(
                          hintText: "+91 - ",
                          counterText: "",
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: const Color.fromARGB(255, 231, 231, 231),
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: const Color.fromARGB(255, 231, 231, 231),
                            ),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: const Color.fromARGB(255, 231, 231, 231),
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 12),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      flex: 4,
                      child: TextFormField(
                        maxLength: 10,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Phone number is required";
                          }

                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: _phoneNumber,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          hintText: "Enter phone",
                          counterText: "",
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: kPrimary),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: const Color.fromARGB(255, 231, 231, 231),
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 12),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 22),
                BlocConsumer<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state is AuthVerifySuccess) {
                      log("State : $state");
                      context.push(
                        page: OTPPage(phoneNumber: _phoneNumber.text.trim()),
                      );
                    }
                    if (state is AuthNewUser) {
                      log("State : $state");
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: kPrimary,
                          behavior: SnackBarBehavior.floating,
                          content: Text(
                            "User not found!, Please register",
                            style: context.bodyLarge.copyWith(
                              fontWeight: FontWeight.bold,
                              color: kWhite,
                            ),
                          ),
                        ),
                      );
                      context.push(
                        page: InfoPage(phoneNumber: _phoneNumber.text.trim()),
                      );
                    }
                    if (state is AuthError) {
                      log("$state : ${state.message}");
                    }
                  },
                  builder: (context, state) {
                    final isLoading = state is AuthLoading;

                    return SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isLoading ? Colors.grey : kPrimary,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: isLoading
                            ? null
                            : () {
                                final number = _phoneNumber.text.trim();
                                if (_formKey.currentState!.validate()) {
                                  context.read<AuthBloc>().add(
                                    AuthVerifyEvent(phoneNumber: number),
                                  );
                                }
                              },
                        child: isLoading
                            ? const SizedBox(
                                height: 24,
                                width: 24,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2.5,
                                  color: kWhite,
                                ),
                              )
                            : Text(
                                "Login",
                                style: context.bodyLarge.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: kWhite,
                                ),
                              ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 22),
                GestureDetector(
                  onTap: () => context.push(page: PrivacyPolicy()),
                  child: Text.rich(
                    textAlign: TextAlign.center,
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "By Continuing you accepting the ",

                          style: context.bodyMedium.copyWith(),
                        ),
                        TextSpan(
                          text: "Terms of Use & Privacy Policy",
                          style: context.bodyMedium.copyWith(
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
