import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skilltest/features/home/bloc/banners/bloc/banner_bloc.dart';
import 'package:skilltest/features/home/models/banner_model.dart';

class BannerCarousel extends StatelessWidget {
  const BannerCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BannerBloc, BannerState>(
      builder: (context, state) {
        if (state is BannerLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is BannerError) {
          return const Center(child: Text("Failed to load banners"));
        }
        if (state is BannerSuccess) {
          final List<BannerModel> banners = state.result;

          return CarouselSlider.builder(
            itemCount: banners.length,
            itemBuilder: (context, index, realIndex) {
              final banner = banners[index];
              return ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  banner.image ?? "",
                  errorBuilder: (context, error, _) =>
                      Container(color: Colors.grey.shade200),
                ),
              );
            },
            options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 0.9,
              autoPlayAnimationDuration: Duration(milliseconds: 1200),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
