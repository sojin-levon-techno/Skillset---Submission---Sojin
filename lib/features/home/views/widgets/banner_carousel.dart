import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skilltest/core/colors/colors.dart';
import 'package:skilltest/core/helper/cache_manager.dart';
import 'package:skilltest/features/home/bloc/banners/bloc/banner_bloc.dart';
import 'package:skilltest/features/home/models/banner_model.dart';
import 'package:skilltest/features/home/views/widgets/banner_loading.dart';

class BannerCarousel extends StatelessWidget {
  const BannerCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BannerBloc, BannerState>(
      builder: (context, state) {
        if (state is BannerLoading) {
          return const BannerLoadingWidget();
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
                child: CachedNetworkImage(
                  height: 120,
                  width: double.infinity,
                  imageUrl: banner.image ?? "",
                  cacheManager: CacheManagerHelper.instance,
                  placeholder: (context, url) {
                    return Center(
                      child: SizedBox(
                        width: 40,
                        height: 40,
                        child: CircularProgressIndicator(
                          color: kPrimary,
                          strokeWidth: 3,
                        ),
                      ),
                    );
                  },
                  errorWidget: (context, url, error) => const Icon(Icons.error),
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
