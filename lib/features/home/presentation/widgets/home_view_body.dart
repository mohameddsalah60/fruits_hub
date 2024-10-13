import 'package:flutter/material.dart';
import 'package:fruits_hub/core/widgets/custom_fruit_item.dart';
import 'package:fruits_hub/core/widgets/custom_search_textfield.dart';

import 'best_selling_header.dart';
import 'custom_home_appbar.dart';
import 'featured_banner_list.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
                child: Column(
              children: [
                CustomHomeAppBar(),
                SizedBox(
                  height: 16,
                ),
                CustomSearchTextfield(),
                SizedBox(
                  height: 12,
                ),
                FeaturedBannerList(),
                SizedBox(
                  height: 16,
                ),
                BestSellingHeader(),
                CustomFruitItem(),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
