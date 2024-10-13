import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

class CustomFruitItem extends StatelessWidget {
  const CustomFruitItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 200,
      decoration: const BoxDecoration(
        color: Color(0xffF3F5F7),
        borderRadius: BorderRadius.all(
          Radius.circular(4),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            top: 0,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite_outline),
            ),
          ),
          Positioned.fill(
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 17),
                child: Image.asset(Assets.imagesStrwTest),
              ),
              const SizedBox(
                height: 24,
              ),
              ListTile(
                title: const Padding(
                  padding: EdgeInsets.only(bottom: 4),
                  child: Text(
                    'فراولة',
                    style: TextStyles.semiBold13,
                  ),
                ),
                subtitle: Row(
                  children: [
                    Text(
                      '30جنية /',
                      style: TextStyles.bold13.copyWith(
                        color: const Color(0xffF4A91F),
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      'الكيلو',
                      style: TextStyles.semiBold13.copyWith(
                        color: const Color(0xffF8C76D),
                      ),
                    ),
                  ],
                ),
                trailing: const CircleAvatar(
                  backgroundColor: AppColors.primaryColor,
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }
}
