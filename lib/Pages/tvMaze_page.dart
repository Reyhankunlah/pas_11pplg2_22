import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_22/Components/backDecoration.dart';
import 'package:pas_mobile_11pplg2_22/Components/custom_button.dart';
import 'package:pas_mobile_11pplg2_22/Components/custom_color.dart';
import 'package:pas_mobile_11pplg2_22/Components/custom_text.dart';
import 'package:pas_mobile_11pplg2_22/Controllers/API/tvMazeAPI_controller.dart';
import 'package:pas_mobile_11pplg2_22/Controllers/favorite_controller.dart';

class TvmazePage extends StatelessWidget {
  final c = Get.find<TvmazeapiController>();
  final fav = Get.find<FavoriteController>();

  TvmazePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.background,

      //appBar: AppBar(title: CustomText(myText: 'Top Anime')),
      body: Stack(
        children: [
          BackDecoration(),

          Obx(() {
            if (c.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }

            if (c.errorMessage.value != null) {
              return Center(child: Text(c.errorMessage.value!));
            }

            final animeList = c.animeList;

            return RefreshIndicator(
              onRefresh: () => c.fetchTopAnime(),
              color: Colors.blue,
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(), // wajib
                itemCount: animeList.length,
                itemBuilder: (context, index) {
                  final anime = animeList[index];
                  final title = anime['name'];
                  final imageUrl =
                      anime['image']['medium'] ?? anime['image']['original'];
                  final genres = anime['genres'] ?? 'N/A';
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: Image.network(
                              imageUrl,
                              width: 60,
                              height: 90,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Expanded(
                            child: CustomText(
                              myText: title,
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ),
                          Expanded(
                            child: CustomText(
                              myText: genres[0] ?? "",
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              fav.addFromForm(title, genres[0], imageUrl);
                            },
                            icon: Icon(Icons.bookmark),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            );
          }),
        ],
      ),
    );
  }
}
