import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skilltest/core/colors/colors.dart';
import 'package:skilltest/core/extension/textstyle.dart';
import 'package:skilltest/core/helper/cache_manager.dart';
import 'package:skilltest/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:skilltest/features/wishlist/models/wishlist_model.dart';

class WishlistTiles extends StatelessWidget {
  const WishlistTiles({super.key, required this.wishlist});

  final WishListModel wishlist;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  imageUrl: wishlist.featuredImage ?? "",
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
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                // child: Image.network(
                //   wishlist.featuredImage ?? "",
                //   height: 120,
                //   width: double.infinity,
                //   fit: BoxFit.cover,
                //   loadingBuilder: (context, child, loadingProgress) {
                //     if (loadingProgress == null) {
                //       return child;
                //     }

                //     final expected = loadingProgress.expectedTotalBytes;
                //     final loaded = loadingProgress.cumulativeBytesLoaded;

                //     double progress = 0;
                //     if (expected != null) {
                //       progress = loaded / expected;
                //     }

                //     return Container(
                //       height: 120,
                //       width: double.infinity,
                //       color: Colors.grey.shade200,
                //       child: Stack(
                //         alignment: Alignment.center,
                //         children: [
                //           SizedBox(
                //             width: 60,
                //             height: 60,
                //             child: CircularProgressIndicator(
                //               color: kPrimary,
                //               value: expected != null ? progress : null,
                //               strokeWidth: 3,
                //             ),
                //           ),
                //           if (expected != null)
                //             Text("${(progress * 100).toStringAsFixed(0)}%"),
                //         ],
                //       ),
                //     );
                //   },
                //   errorBuilder: (context, error, stackTrace) {
                //     return Container(
                //       height: 120,
                //       width: double.infinity,
                //       color: Colors.grey.shade200,
                //       alignment: Alignment.center,
                //       child: const Icon(Icons.broken_image, color: Colors.grey),
                //     );
                //   },
                // ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: BlocBuilder<WishlistBloc, WishlistState>(
                  builder: (context, state) {
                    final isWishListed = wishlist.inWishlist == true;
                    return IconButton(
                      onPressed: () {
                        context.read<WishlistBloc>().add(
                          WishListOperationEvent(
                            productId: wishlist.id.toString(),
                          ),
                        );
                      },
                      icon: isWishListed
                          ? Icon(Icons.favorite, color: kPrimary)
                          : Icon(Icons.favorite_outline, color: kPrimary),
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
                      "₹${wishlist.mrp}",
                      style: context.bodyMedium.copyWith(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      "₹${wishlist.salePrice}",
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
                      "${wishlist.avgRating?.toDouble() ?? 4.5}",
                      style: context.bodyMedium.copyWith(),
                    ),
                  ],
                ),

                const SizedBox(height: 6),

                Text(
                  wishlist.name ?? "",
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
    );
  }
}
