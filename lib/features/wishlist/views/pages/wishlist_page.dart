import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skilltest/core/colors/colors.dart';
import 'package:skilltest/core/extension/textstyle.dart';
import 'package:skilltest/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:skilltest/features/wishlist/views/widgets/wishlist_empty.dart';
import 'package:skilltest/features/wishlist/views/widgets/wishlist_loading.dart';
import 'package:skilltest/features/wishlist/views/widgets/wishlist_tiles.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  @override
  void initState() {
    context.read<WishlistBloc>().add(FetchWishListItems());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My WishList",
          style: context.titleLarge.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: RefreshIndicator(
        backgroundColor: kWhite,
        color: kPrimary,
        onRefresh: () async {
          context.read<WishlistBloc>().add(FetchWishListItems());
        },
        child: BlocBuilder<WishlistBloc, WishlistState>(
          builder: (context, state) {
            if (state is WishlistError) {
              log("$state : ${state.message}");
              return WishListLoadingWidget();
            }
            if (state is WishlistSuccess) {
              final res = state.result;

              if (res.isEmpty) {
                return WishlistEmpty();
              }

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
                itemCount: res.length,
                itemBuilder: (context, index) {
                  final wishlist = res[index];

                  return WishlistTiles(wishlist: wishlist);
                },
              );
            }
            if (state is WishlistLoading) {
              return WishListLoadingWidget();
            }
            return WishListLoadingWidget();
          },
        ),
      ),
    );
  }
}
