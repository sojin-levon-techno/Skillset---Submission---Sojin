import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skilltest/core/constants/constants.dart';
import 'package:skilltest/core/extension/navigation.dart';
import 'package:skilltest/core/extension/textstyle.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

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
              "Privacy Policy",
              style: context.titleLarge.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              """Your privacy is important to us. This privacy statement explains how our app collects, uses, and protects your personal information.

Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi 
ut aliquip ex ea commodo consequat.

Information We Collect:
1. Personal data such as phone number and name (for login & authentication).  
2. Usage data such as interactions with products and wishlist.  
3. Device information for improving user experience.  

How We Use Information:
- To provide and maintain our services.  
- To notify you about changes to our services.  
- To provide customer support and improve performance.  

We do not share your personal information with third parties without your consent, except as required by law.

By using this app, you agree to the terms of this Privacy Policy.""",
              style: context.bodyMedium.copyWith(height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}
