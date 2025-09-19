import 'package:flutter/material.dart';
import 'package:skilltest/features/home/views/widgets/product_list.dart';
import 'package:skilltest/features/home/views/widgets/product_search_bar.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});

  final ValueNotifier<String> searchQuery = ValueNotifier("");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: ProductSearchBar(searchQuery: searchQuery),
      ),
      body: ProductList(isHome: false, searchQuery: searchQuery),
    );
  }
}
