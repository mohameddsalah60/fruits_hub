import 'package:flutter/material.dart';
import 'package:fruits_hub/core/widgets/custom_fruit_item.dart';

class BestSellingGridView extends StatelessWidget {
  const BestSellingGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 16,
        childAspectRatio: 163 / 260,
      ),
      itemBuilder: (context, index) {
        return const CustomFruitItem();
      },
    );
  }
}
