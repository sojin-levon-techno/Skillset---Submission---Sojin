import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skilltest/core/colors/colors.dart';
import 'package:skilltest/core/extension/textstyle.dart';
import 'package:skilltest/features/home/bloc/products/bloc/product_bloc.dart';

class ProductList extends StatelessWidget {
  final bool isHome;
  const ProductList({super.key, required this.isHome});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is ProductError) {
          return const Center(child: Text("Failed to load products"));
        }

        if (state is ProductSuccess) {
          final products = state.result;

          return GridView.builder(
            padding: const EdgeInsets.all(12),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.9,
            ),
            itemCount: isHome ? 4 : products.length,
            itemBuilder: (context, index) {
              final product = products[index];

              return isHome
                  ? Container(
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
                          // Product Image + Wishlist Heart
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                ),
                                child: Image.network(
                                  product.featuredImage ?? "",
                                  height: 120,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
                                        if (loadingProgress == null) {
                                          return child;
                                        }

                                        final expected =
                                            loadingProgress.expectedTotalBytes;
                                        final loaded = loadingProgress
                                            .cumulativeBytesLoaded;

                                        double progress = 0;
                                        if (expected != null) {
                                          progress = loaded / expected;
                                        }

                                        return Container(
                                          height: 120,
                                          width: double.infinity,
                                          color: Colors.grey.shade200,
                                          child: Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              SizedBox(
                                                width: 60,
                                                height: 60,
                                                child:
                                                    CircularProgressIndicator(
                                                      color: kPrimary,
                                                      value: expected != null
                                                          ? progress
                                                          : null,
                                                      strokeWidth: 3,
                                                    ),
                                              ),
                                              if (expected != null)
                                                Text(
                                                  "${(progress * 100).toStringAsFixed(0)}%",
                                                ),
                                            ],
                                          ),
                                        );
                                      },
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      height: 120,
                                      width: double.infinity,
                                      color: Colors.grey.shade200,
                                      alignment: Alignment.center,
                                      child: const Icon(
                                        Icons.broken_image,
                                        color: Colors.grey,
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Positioned(
                                top: 8,
                                right: 8,
                                child: Icon(
                                  Icons.favorite,
                                  color: product.inWishlist == true
                                      ? Colors.red
                                      : Colors.grey.shade300,
                                ),
                              ),
                            ],
                          ),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Price Row
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

                                // Rating
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Colors.orange,
                                      size: 16,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      "${product.avgRating?.toDouble() ?? 4.5}",
                                      style: context.bodyMedium.copyWith(),
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 6),

                                // Product Name
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
                    )
                  : Container(
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
                              // Product Image + Wishlist Heart
                              Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      topRight: Radius.circular(12),
                                    ),
                                    child: Image.network(
                                      product.featuredImage ?? "",
                                      height: 120,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                      loadingBuilder:
                                          (context, child, loadingProgress) {
                                            if (loadingProgress == null) {
                                              return child;
                                            }

                                            final expected = loadingProgress
                                                .expectedTotalBytes;
                                            final loaded = loadingProgress
                                                .cumulativeBytesLoaded;

                                            double progress = 0;
                                            if (expected != null) {
                                              progress = loaded / expected;
                                            }

                                            return Container(
                                              height: 120,
                                              width: double.infinity,
                                              color: Colors.grey.shade200,
                                              child: Stack(
                                                alignment: Alignment.center,
                                                children: [
                                                  SizedBox(
                                                    width: 60,
                                                    height: 60,
                                                    child:
                                                        CircularProgressIndicator(
                                                          color: kPrimary,

                                                          value:
                                                              expected != null
                                                              ? progress
                                                              : null,
                                                          strokeWidth: 3,
                                                        ),
                                                  ),
                                                  if (expected != null)
                                                    Text(
                                                      "${(progress * 100).toStringAsFixed(0)}%",
                                                    ),
                                                ],
                                              ),
                                            );
                                          },
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                            return Container(
                                              height: 120,
                                              width: double.infinity,
                                              color: Colors.grey.shade200,
                                              alignment: Alignment.center,
                                              child: const Icon(
                                                Icons.broken_image,
                                                color: Colors.grey,
                                              ),
                                            );
                                          },
                                    ),
                                  ),
                                  Positioned(
                                    top: 8,
                                    right: 8,
                                    child: Icon(
                                      Icons.favorite,
                                      color: product.inWishlist == true
                                          ? Colors.red
                                          : Colors.grey.shade300,
                                    ),
                                  ),
                                ],
                              ),

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Price Row
                                    Row(
                                      children: [
                                        Text(
                                          "₹${product.mrp}",
                                          style: context.bodyMedium.copyWith(
                                            decoration:
                                                TextDecoration.lineThrough,
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

                                    // Rating
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          color: Colors.orange,
                                          size: 16,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          "${product.avgRating?.toDouble() ?? 4.5}",
                                          style: context.bodyMedium.copyWith(),
                                        ),
                                      ],
                                    ),

                                    const SizedBox(height: 6),

                                    // Product Name
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
                        )
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
        }

        return const SizedBox.shrink();
      },
    );
  }
}
