// ignore_for_file: deprecated_member_use

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skilltest/core/colors/colors.dart';
import 'package:skilltest/core/extension/navigation.dart';
import 'package:skilltest/core/extension/textstyle.dart';
import 'package:skilltest/core/helper/cache_manager.dart';
import 'package:skilltest/features/home/models/product_model.dart';
import 'package:skilltest/features/home/views/pages/view_product_page.dart';
import 'package:skilltest/features/wishlist/bloc/wishlist_bloc.dart';

class ProductTiles extends StatelessWidget {
  const ProductTiles({
    super.key,
    required this.product,
    required this.isSearch,
  });

  final ProductModel product;
  final bool isSearch;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(page: ViewProductPage(product: product)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 5,
              spreadRadius: 2,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  child: CachedNetworkImage(
                    height: 120,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    imageUrl: product.featuredImage ?? "",
                    cacheManager: CacheManagerHelper.instance,
                    placeholder: (context, url) {
                      return Container(
                        height: 120,
                        width: double.infinity,
                        color: Colors.grey.shade200,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              width: 40,
                              height: 40,
                              child: CircularProgressIndicator(
                                color: kPrimary,
                                strokeWidth: 3,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
                isSearch
                    ? SizedBox.shrink()
                    : Positioned(
                        top: 8,
                        right: 8,
                        child: BlocBuilder<WishlistBloc, WishlistState>(
                          builder: (context, state) {
                            final isWishListed = product.inWishlist == true;
                            return IconButton(
                              onPressed: () {
                                context.read<WishlistBloc>().add(
                                  WishListOperationEvent(
                                    productId: product.id.toString(),
                                  ),
                                );
                              },
                              icon: isWishListed
                                  ? Icon(Icons.favorite, color: kPrimary)
                                  : Icon(
                                      Icons.favorite_outline,
                                      color: kPrimary,
                                    ),
                            );
                          },
                        ),
                      ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "₹${product.mrp}",
                        style: context.bodyMedium.copyWith(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        "₹${product.salePrice}",
                        style: context.bodyMedium.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 4),

                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.orange, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        "${product.avgRating?.toDouble() ?? 4.5}",
                        style: context.bodyMedium.copyWith(),
                      ),
                    ],
                  ),

                  const SizedBox(height: 6),

                  Text(
                    product.name ?? "",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.bodyMedium.copyWith(
                      fontWeight: FontWeight.w600,
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
}
