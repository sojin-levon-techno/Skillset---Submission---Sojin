import 'package:flutter/material.dart';
import 'package:skilltest/core/colors/colors.dart';
import 'package:skilltest/core/constants/constants.dart';
import 'package:skilltest/core/extension/textstyle.dart';
import 'package:skilltest/features/auth/views/widgets/app_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: kPadding16,
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
              AppButton(name: "Login", onPressed: () {}),
              const SizedBox(height: 22),
              Text.rich(
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
            ],
          ),
        ),
      ),
    );
  }
}
