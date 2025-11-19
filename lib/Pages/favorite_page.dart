import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pas_mobile_11pplg2_22/Components/custom_text.dart';
import 'package:pas_mobile_11pplg2_22/Controllers/favorite_controller.dart';

class FavoritePage extends StatelessWidget {
  FavoritePage({super.key});
  final fav = Get.find<FavoriteController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(), // wajib
        itemCount: fav.show.length,
        itemBuilder: (context, index) {
          final show = fav.show[index];
          final title = fav.titleC;
          final imageUrl = fav.imageUrlC;
          final genres = fav.genreC;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Image.network(
                      imageUrl.string,
                      width: 60,
                      height: 90,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: CustomText(
                      myText: title.string,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                  Expanded(
                    child: CustomText(
                      myText: genres.string,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      fav.deleteShow(index);
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
  }
}
