import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skilltest/core/constants/constants.dart';
import 'package:skilltest/core/extension/navigation.dart';
import 'package:skilltest/core/extension/textstyle.dart';

class TermsConditions extends StatelessWidget {
  const TermsConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(CupertinoIcons.back),
        ),
      ),
      body: Padding(
        padding: kPadding16,
        child: ListView(
          children: [
            Text(
              "Terms & Conditions",
              style: context.titleLarge.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              """Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi 
ut aliquip ex ea commodo consequat.

Duis aute irure dolor in reprehenderit in voluptate velit esse 
cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat 
cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

1. You must agree to these terms before using the app.  
2. All data is handled according to our Privacy Policy.  
3. Any misuse of the application may result in suspension of your account.  

Thank you for using our app!""",
              style: context.bodyMedium.copyWith(height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}
