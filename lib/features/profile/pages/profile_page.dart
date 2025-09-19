// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skilltest/core/colors/colors.dart';
import 'package:skilltest/core/constants/constants.dart';
import 'package:skilltest/core/extension/navigation.dart';
import 'package:skilltest/core/extension/textstyle.dart';
import 'package:skilltest/features/auth/views/pages/login_page.dart';
import 'package:skilltest/features/profile/pages/privacy_policy.dart';
import 'package:skilltest/features/profile/pages/terms_conditions.dart';
import 'package:skilltest/features/profile/pages/view_profile_page.dart';
import 'package:skilltest/features/profile/widgets/bottom_sheet.dart';

class ProfilePage extends StatelessWidget {
  final String? name;
  final String? phoneNumber;
  const ProfilePage({super.key, this.name, this.phoneNumber});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(
        "My Profile",
        style: context.titleLarge.copyWith(fontWeight: FontWeight.bold),
      ),
    ),
    bottomNavigationBar: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("Version", style: context.bodyMedium.copyWith(color: Colors.grey)),
        Text(
          "3.35.2",
          style: context.bodyMedium.copyWith(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
    body: Padding(
      padding: kPadding16,
      child: ListView(
        children: [
          const SizedBox(height: 26),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              children: [
                ListTile(
                  onTap: () => context.push(
                    page: ViewProfilePage(
                      name: name ?? "John Deo",
                      phoneNumber: phoneNumber ?? "8935200364",
                    ),
                  ),
                  trailing: const Icon(CupertinoIcons.right_chevron),
                  title: Text(
                    "View Profile",
                    style: context.bodyMedium.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(padding: kPadding16, child: const Divider()),
                ListTile(
                  onTap: () => context.push(page: PrivacyPolicy()),
                  trailing: const Icon(CupertinoIcons.right_chevron),
                  title: Text(
                    "Privacy & Policy",
                    style: context.bodyMedium.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(padding: kPadding16, child: const Divider()),
                ListTile(
                  onTap: () => context.push(page: TermsConditions()),
                  trailing: const Icon(CupertinoIcons.right_chevron),
                  title: Text(
                    "Terms & Conditions",
                    style: context.bodyMedium.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(padding: kPadding16, child: const Divider()),
                ListTile(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => AndroidBottomSheetWidget(
                        cancelText: Text(
                          "Cancel",
                          style: context.bodyMedium.copyWith(
                            fontWeight: FontWeight.bold,
                            color: kWhite,
                          ),
                        ),
                        confirmText: Text(
                          "Logout",
                          style: context.bodyMedium.copyWith(
                            fontWeight: FontWeight.bold,
                            color: kPrimary,
                          ),
                        ),
                        message: "Are you sure you want to logout?",
                        title: "Logout",
                        cancel: () {
                          context.pop();
                        },
                        confirm: () {
                          context.pushAndRemoveUntil(page: LoginPage());
                        },
                      ),
                    );
                  },
                  trailing: const Icon(
                    CupertinoIcons.right_chevron,
                    color: kRed,
                  ),
                  title: Text(
                    "Logout",
                    style: context.bodyMedium.copyWith(
                      fontWeight: FontWeight.bold,
                      color: kRed,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
