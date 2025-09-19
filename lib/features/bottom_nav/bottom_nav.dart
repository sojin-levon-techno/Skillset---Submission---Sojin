import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:skilltest/core/colors/colors.dart';
import 'package:skilltest/features/home/views/pages/home_page.dart';
import 'package:skilltest/features/profile/pages/profile_page.dart';
import 'package:skilltest/features/wishlist/views/pages/wishlist_page.dart';

class AppBottomNav extends StatefulWidget {
  final String? name;
  final String? phoneNumber;

  const AppBottomNav({super.key, this.name, this.phoneNumber});

  @override
  State<AppBottomNav> createState() => _AppBottomNavState();
}

class _AppBottomNavState extends State<AppBottomNav> {
  final ValueNotifier<int> _selectedIndex = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      const HomePage(),
      const WishlistPage(),
      ProfilePage(name: widget.name, phoneNumber: widget.phoneNumber),
    ];

    return Scaffold(
      body: ValueListenableBuilder<int>(
        valueListenable: _selectedIndex,
        builder: (context, index, _) {
          return IndexedStack(index: index, children: pages);
        },
      ),
      bottomNavigationBar: ValueListenableBuilder<int>(
        valueListenable: _selectedIndex,
        builder: (context, index, _) {
          return SafeArea(
            top: false,
            bottom: true,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(32),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 8,
                ),
                child: GNav(
                  gap: 8,
                  color: Colors.grey,
                  activeColor: Colors.white,
                  tabBackgroundColor: kPrimary,
                  padding: const EdgeInsets.all(12),
                  selectedIndex: index,
                  onTabChange: (newIndex) => _selectedIndex.value = newIndex,
                  tabs: const [
                    GButton(icon: Icons.home, text: 'Home'),
                    GButton(icon: Icons.favorite_border, text: 'Wishlist'),
                    GButton(icon: Icons.person, text: 'Profile'),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
