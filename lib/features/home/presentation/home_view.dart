import 'package:flutter/material.dart';
import 'package:fruits_hub/features/home/presentation/widgets/home_view_body.dart';

import 'widgets/custom_bottom_navigation_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const routeName = 'home_view';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: CustombottomNavigationBar(),
      body: HomeViewBody(),
    );
  }
}
