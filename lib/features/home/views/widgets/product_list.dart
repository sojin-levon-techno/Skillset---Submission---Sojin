import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skilltest/core/colors/colors.dart';
import 'package:skilltest/core/extension/textstyle.dart';
import 'package:skilltest/features/home/bloc/products/bloc/product_bloc.dart';
import 'package:skilltest/features/home/views/widgets/product_loading_widget.dart';
import 'package:skilltest/features/home/views/widgets/product_tiles.dart';
import 'package:skilltest/features/wishlist/bloc/wishlist_bloc.dart';

class ProductList extends StatelessWidget {
  final bool isHome;
  final ValueNotifier<String>? searchQuery;

  const ProductList({super.key, required this.isHome, this.searchQuery});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return const ProductLoadingWidget();
        }

        if (state is ProductError) {
          return const ProductLoadingWidget();
        }

        if (state is ProductSuccess) {
          final products = state.result;

          return ValueListenableBuilder<String>(
            valueListenable: searchQuery ?? ValueNotifier(""),
            builder: (context, query, _) {
              final filtered = query.isEmpty
                  ? products
                  : products
                        .where(
                          (p) => (p.name ?? "").toLowerCase().contains(
                            query.toLowerCase(),
                          ),
                        )
                        .toList();

              if (filtered.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(CupertinoIcons.search, color: kPrimary, size: 100),
                      Text(
                        "No products found",
                        style: context.bodyLarge.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              }

              return BlocConsumer<WishlistBloc, WishlistState>(
                listener: (context, state) {
                  if (state is WishListOperationSuccess) {
                    log("state : $state");
                    context.read<WishlistBloc>().add(FetchWishListItems());
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: kPrimary,
                        content: Text(
                          state.message,
                          style: context.bodyLarge.copyWith(
                            fontWeight: FontWeight.bold,
                            color: kWhite,
                          ),
                        ),
                      ),
                    );
                  }
                  if (state is WishlistError) {
                    log("$state : ${state.message}");
                  }
                },
                builder: (context, state) {
                  return GridView.builder(
                    padding: const EdgeInsets.all(12),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio: 0.9,
                        ),
                    itemCount: filtered.length,
                    itemBuilder: (context, index) {
                      final product = filtered[index];

                      return isHome
                          ? ProductTiles(product: product, isSearch: false)
                          : ProductTiles(product: product, isSearch: false)
                                .animate()
                                .fade(duration: 500.ms, delay: (index * 100).ms)
                                .slideY(
                                  begin: 1,
                                  end: 0,
                                  duration: 600.ms,
                                  curve: Curves.easeOut,
                                );
                    },
                  );
                },
              );
            },
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
