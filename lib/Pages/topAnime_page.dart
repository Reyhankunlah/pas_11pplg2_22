import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_22/Components/backDecoration.dart';
import 'package:pas_mobile_11pplg2_22/Components/custom_color.dart';
import 'package:pas_mobile_11pplg2_22/Components/custom_header.dart';
import 'package:pas_mobile_11pplg2_22/Components/custom_text.dart';
import 'package:pas_mobile_11pplg2_22/Controllers/topAnime_controller.dart';

class TopanimePage extends StatelessWidget {
  final topAnController = Get.find<TopanimeController>();

  TopanimePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.background,
      body: Stack(
        children: [
          BackDecoration(),
          CustomHeader(judulHeader: 'Top Anime'),

          Padding(
            padding: const EdgeInsets.only(top: 120),
            child: Obx(() {
              if (topAnController.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              if (topAnController.errorMessage.value != null) {
                return Center(child: Text(topAnController.errorMessage.value!));
              }

              final animeList = topAnController.animeList;

              return RefreshIndicator(
                onRefresh: () => topAnController.fetchTopAnime(),
                child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: animeList.length,
                  itemBuilder: (context, index) {
                    final anime = animeList[index];
                    final title = anime['title'];
                    final imageUrl = anime['images']['jpg']['image_url'];
                    final score = anime['score'] ?? 'N/A';

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
                        subtitle: CustomText(myText: "Score: $score"),
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
