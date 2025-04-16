import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/features/on_boarding/presentation/views/widgets/page_view_item.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      physics: const BouncingScrollPhysics(),
      children: [
        PageViewItem(
          image: Assets.imagesPageviewItem1Image,
          subTitle:
              'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
          backgroundImage: Assets.imagesPageviewItem1Backgroundimage,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('مرحبًا بك في', style: TextStyles.bold23),
              Text(
                ' HUB',
                style:
                    TextStyles.bold23.copyWith(color: AppColors.secondaryColor),
              ),
              Text(
                'Fruit',
                style:
                    TextStyles.bold23.copyWith(color: AppColors.primaryColor),
              ),
            ],
          ),
          isVisible: true,
        ),
        const PageViewItem(
          isVisible: false,
          image: Assets.imagesPageviewItem2Image,
          subTitle:
              'نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية',
          backgroundImage: Assets.imagesPageviewItem2Backgroundimage,
          title: Text(
            'ابحث وتسوق',
            style: TextStyles.bold23,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
