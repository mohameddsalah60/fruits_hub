import 'package:flutter/material.dart';
import 'package:fruits_hub/features/home/presentation/widgets/featured_banner_item.dart';

class FeaturedBannerList extends StatelessWidget {
  const FeaturedBannerList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          4,
          (index) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: FeaturedBannerItem(),
            );
          },
        ),
      ),
    );
  }
}