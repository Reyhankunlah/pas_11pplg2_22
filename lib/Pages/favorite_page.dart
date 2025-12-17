import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_22/Components/backDecoration.dart';
import 'package:pas_mobile_11pplg2_22/Components/custom_color.dart';
import 'package:pas_mobile_11pplg2_22/Components/custom_header.dart';
import 'package:pas_mobile_11pplg2_22/Components/custom_text.dart';
import 'package:pas_mobile_11pplg2_22/Controllers/favorite_controller.dart';

class FavoritePage extends StatelessWidget {
  FavoritePage({super.key});
  final fav = Get.find<FavoriteController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.background,
      body: Stack(
        children: [
          BackDecoration(),
          CustomHeader(judulHeader: "Favorite"),

          Padding(
            padding: const EdgeInsets.only(top: 120),
            child: Obx(() {
              if (fav.show.isEmpty) {
                return const Center(child: Text("No Favorites Yet"));
              }

              return ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: fav.show.length,
                itemBuilder: (context, index) {
                  final show = fav.show[index];

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
                          show.imageUrl,
                          width: 60,
                          height: 90,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: CustomText(
                        myText: show.title,
                        fontWeight: FontWeight.bold,
                      ),
                      subtitle: CustomText(myText: show.genre),
                      trailing: IconButton(
                        icon: const Icon(Icons.bookmark),
                        onPressed: () => fav.deleteShow(show.id!),
                      ),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
