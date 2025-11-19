import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_22/Components/custom_text.dart';
import 'package:pas_mobile_11pplg2_22/Controllers/favorite_controller.dart';

class FavoritePage extends StatelessWidget {
  FavoritePage({super.key});
  final fav = Get.find<FavoriteController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (fav.show.isEmpty) {
          return const Center(child: Text("Belum ada favorit"));
        }

        return ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: fav.show.length,
          itemBuilder: (context, index) {
            final show = fav.show[index];

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Image.network(
                    show.imageUrl.isNotEmpty ? show.imageUrl : "",
                    width: 60,
                    height: 90,
                    fit: BoxFit.cover,
                  ),

                  const SizedBox(width: 10),
                  Expanded(
                    child: CustomText(
                      myText: show.title,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                  Expanded(
                    child: CustomText(
                      myText: show.genre,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      fav.deleteShow(show.id!);
                    },
                    icon: const Icon(Icons.bookmark_remove, color: Colors.red),
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
