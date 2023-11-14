import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:macstore/models/category_models.dart';

class CategoryController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  RxList<CategoryModel> categories = <CategoryModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    _fetchCategories();
  }

  void _fetchCategories() {
    _firestore.collection('categories').snapshots().listen((querySnapshot) {
      categories.assignAll(
        querySnapshot.docs.map((doc) {
          final data = doc.data() as Map<String, dynamic>;
          return CategoryModel(
            categoryName: data['categoryName'],
            categoryImage: data['categoryImage'],
          );
        }).toList(),
      );
    }, onError: (error) {
      print("Error fetching categories: $error");
    });
  }
}
