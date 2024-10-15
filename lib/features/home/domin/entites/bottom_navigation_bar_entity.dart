import 'package:fruits_hub/core/utils/app_images.dart';

class BottomNavigationBarEntity {
  final String inActiveImage, activeImage;
  final String name;

  BottomNavigationBarEntity(
      {required this.inActiveImage,
      required this.activeImage,
      required this.name});
}

List<BottomNavigationBarEntity> get bottomNavigationBarItem => [
      BottomNavigationBarEntity(
        activeImage: Assets.imagesIconsBottomBoldHome,
        inActiveImage: Assets.imagesIconsBottomOutlineHome,
        name: 'الرئيسية',
      ),
      BottomNavigationBarEntity(
        activeImage: Assets.imagesIconsBottomBoldProducts,
        inActiveImage: Assets.imagesIconsBottomOutlineProducts,
        name: 'المنتجات',
      ),
      BottomNavigationBarEntity(
        activeImage: Assets.imagesIconsBottomBoldShoppingCart,
        inActiveImage: Assets.imagesIconsBottomOutlineShoppingCart,
        name: 'سلة التسوق',
      ),
      BottomNavigationBarEntity(
        activeImage: Assets.imagesIconsBottomBoldUser,
        inActiveImage: Assets.imagesIconsBottomOutlineUser,
        name: 'حسابي',
      ),
    ];
