import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skilltest/core/colors/colors.dart';
import 'package:skilltest/core/extension/textstyle.dart';
import 'package:skilltest/features/home/bloc/banners/bloc/banner_bloc.dart';
import 'package:skilltest/features/home/bloc/products/bloc/product_bloc.dart';
import 'package:skilltest/features/home/views/widgets/appbar_widget.dart';
import 'package:skilltest/features/home/views/widgets/banner_carousel.dart';
import 'package:skilltest/features/home/views/widgets/product_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<BannerBloc>().add(FetchBanner());
    context.read<ProductBloc>().add(FetchProduct());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      backgroundColor: kWhite,
      color: kPrimary,
      onRefresh: () async {
        context.read<BannerBloc>().add(FetchBanner());
        context.read<ProductBloc>().add(FetchProduct());
      },
      child: Scaffold(
        appBar: AppBar(title: AppBarWidget()),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BannerCarousel(),
              Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
                child: Text(
                  "Popular Products",
                  style: context.bodyLarge.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ProductList(isHome: true),
            ],
          ),
        ),
      ),
    );
  }
}
