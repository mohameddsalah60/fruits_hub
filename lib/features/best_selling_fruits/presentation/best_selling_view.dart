import 'package:flutter/material.dart';
import 'package:fruits_hub/core/widgets/custom_app_bar.dart';
import 'package:fruits_hub/features/best_selling_fruits/presentation/views/widgets/best_selling_body.dart';
import 'package:fruits_hub/features/home/presentation/widgets/notifications_widget.dart';

class BestSellingView extends StatelessWidget {
  const BestSellingView({super.key});
  static const routeName = 'bestSelling';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        title: 'الأكثر مبيعًا',
        actions: [
          const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: NotificationWidget())
        ],
      ),
      body: const SafeArea(child: BestSellingBody()),
    );
  }
}
