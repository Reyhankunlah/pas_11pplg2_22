import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_22/Database/db_helper.dart';
import 'package:pas_mobile_11pplg2_22/Models/favoriteShow_model.dart';

class FavoriteController extends GetxController {
  final DBHelper dbHelper = DBHelper();

  RxList<FavoriteshowModel> show = <FavoriteshowModel>[].obs;

  final titleC = "".obs;
  final genreC = "".obs;
  final imageUrlC = "".obs;

  @override
  void onInit() {
    super.onInit();
    loadShow();
  }

  // CRUD LOGIC
  Future<void> loadShow() async {
    final data = await dbHelper.getShows();
    show.assignAll(data);
  }

  Future<void> addFromForm(String title, String genre, String imageUrl) async {
    final title = titleC;
    final genre = genreC;
    final imageUrl = imageUrlC;

    final newTask = FavoriteshowModel(
      title: title.string,
      genre: genre.string,
      imageUrl: imageUrl.string,
    );

    await dbHelper.insertShow(newTask);
    await loadShow();

    Get.back();
    Get.snackbar(
      "Sukses",
      "Show berhasil ditambahkan",
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.all(12),
    );
  }

  Future<void> deleteShow(int id) async {
    await dbHelper.deleteShow(id);
    await loadShow();
  }
}
