import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class TopanimeController extends GetxController {
  final isLoading = false.obs;
  final errorMessage = RxnString();
  final animeList = <dynamic>[].obs;

  static const String url = 'https://api.jikan.moe/v4/top/anime';

  @override
  void onInit() {
    fetchTopAnime();
    super.onInit();
  }

  Future<void> fetchTopAnime() async {
    try {
      isLoading.value = true;
      errorMessage.value = null;

      final response = await http.get(Uri.parse(url));

      print("Status Code: ${response.statusCode}");

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        //final model = TopAnimeModel.fromJson(jsonData);
        //animeList.assignAll(model.data);
        animeList.assignAll(jsonData['data']);
      } else {
        errorMessage.value = "Server error: ${response.statusCode}";
      }
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
