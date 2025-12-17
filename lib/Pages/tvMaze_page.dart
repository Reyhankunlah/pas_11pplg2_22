import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_22/Components/backDecoration.dart';
import 'package:pas_mobile_11pplg2_22/Components/custom_color.dart';
import 'package:pas_mobile_11pplg2_22/Components/custom_header.dart';
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
      body: Stack(
        children: [
          BackDecoration(),
          CustomHeader(judulHeader: "TV Maze API"),

          Padding(
            padding: const EdgeInsets.only(top: 120),
            child: Obx(() {
              if (c.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              if (c.errorMessage.value != null) {
                return Center(child: Text(c.errorMessage.value!));
              }

              final animeList = c.animeList;

              return RefreshIndicator(
                onRefresh: () => c.fetchTopAnime(),
                child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: animeList.length,
                  itemBuilder: (context, index) {
                    final anime = animeList[index];
                    final title = anime['name'];
                    final imageUrl =
                        anime['image']['medium'] ?? anime['image']['original'];
                    final genres = anime['genres'] ?? [];

                    return Card(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 8,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            imageUrl,
                            width: 60,
                            height: 90,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: CustomText(
                          myText: title,
                          fontWeight: FontWeight.bold,
                        ),
                        subtitle: CustomText(
                          myText: genres.isNotEmpty ? genres[0] : "-",
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.bookmark_add_outlined),
                          onPressed: () {
                            fav.addFromForm(title, genres[0], imageUrl);
                          },
                        ),
                      ),
                    );
                  },
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
