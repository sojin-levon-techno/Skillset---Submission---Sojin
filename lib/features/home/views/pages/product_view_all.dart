import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skilltest/core/extension/navigation.dart';
import 'package:skilltest/features/home/views/widgets/product_list.dart';

class ProductViewAllPage extends StatelessWidget {
  const ProductViewAllPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Center(
          child: IconButton(
            onPressed: () => context.pop(),
            icon: Icon(CupertinoIcons.back),
          ),
        ),
      ),
      body: SafeArea(child: ListView(
        children: [
          ProductList(isHome: false),
        ],
      )),
    );
  }
}
