import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_22/Database/db_helper.dart';
import 'package:pas_mobile_11pplg2_22/Models/favoriteShow_model.dart';

class FavoriteController extends GetxController {
  final DBHelper dbHelper = DBHelper();

  RxList<FavoriteshowModel> show = <FavoriteshowModel>[].obs;

  @override
  void onInit() async {
    super.onInit();
    loadShow();
  }

  Future<void> loadShow() async {
    final data = await dbHelper.getShows();
    show.assignAll(data);
  }

  Future<void> addFromForm(String title, String genre, String imageUrl) async {
    final newTask = FavoriteshowModel(
      title: title,
      genre: genre,
      imageUrl: imageUrl,
    );

    await dbHelper.insertShow(newTask);
    await loadShow();

    Get.snackbar(
      "Sukses",
      "Show berhasil ditambahkan",
      snackPosition: SnackPosition.TOP,
    );
  }

  Future<void> deleteShow(int id) async {
    await dbHelper.deleteShow(id);
    await loadShow();
  }
}
