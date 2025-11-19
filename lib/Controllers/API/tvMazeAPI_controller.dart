import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class TvmazeapiController extends GetxController {
  final isLoading = false.obs;
  final errorMessage = RxnString();
  final animeList = <dynamic>[].obs;

  static const String url = 'https://api.tvmaze.com/shows';

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
        animeList.assignAll(jsonData);
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
