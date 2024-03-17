import 'package:farm_fresh/models/categories_model.dart';

import '../services/assets_manager.dart';

class AppConstants {
  static const String imageUrl =
      'https://i.ibb.co/Z8N5LSQ/image1.jpg';

  static List<String> bannersImages = [
    AssetsManager.banner1,
    AssetsManager.banner2
  ];

  static List<CategoriesModel> categoriesList = [
    CategoriesModel(
      id: "Vegetables",
      image: AssetsManager.vegetables,
      name: "Vegetables",
    ),
    CategoriesModel(
      id: "Fruits",
      image: AssetsManager.fruits,
      name: "Fruits",
    ),
  ];
}
