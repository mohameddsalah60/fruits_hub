import 'package:flutter/material.dart';
import 'package:fruits_hub/core/widgets/custom_search_textfield.dart';

import 'custom_home_appbar.dart';

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
              ],
            )),
          ],
        ),
      ),
    );
  }
}
