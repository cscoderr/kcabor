import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kabor_driver/core/theme/theme.dart';

class Category {
  const Category({
    required this.image,
    required this.text,
  });

  final String image;
  final String text;
}

final categoryProvider = StateProvider<List<Category>>((ref) {
  return [
    const Category(
      image: AppImages.breakfast,
      text: 'Breakfasts',
    ),
    const Category(
      image: AppImages.soups,
      text: 'Soups',
    ),
    const Category(
      image: AppImages.drink,
      text: 'Drinks',
    ),
    const Category(
      image: AppImages.snacks,
      text: 'Snacks',
    ),
    const Category(
      image: AppImages.localDishes,
      text: 'Local Dishes',
    ),
  ];
});
