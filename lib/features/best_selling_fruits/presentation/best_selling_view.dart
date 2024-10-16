import 'package:flutter/material.dart';
import 'package:fruits_hub/features/best_selling_fruits/presentation/views/widgets/best_selling_body.dart';

class BestSellingView extends StatelessWidget {
  const BestSellingView({super.key});
  static const routeName = 'bestSelling';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BestSellingBody(),
    );
  }
}
