import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_22/Controllers/navigation_controller.dart';

class BtmnavPage extends StatelessWidget {
  final navigationController = Get.find<NavigationController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: IndexedStack(
          index: navigationController.selectedIndex.value,
          children: navigationController.pages
              .map((pageBuilder) => pageBuilder())
              .toList(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: navigationController.selectedIndex.value,
          onTap: navigationController.changeIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.animation_rounded),
              label: 'Anime',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.tv), label: 'TV Maze'),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      );
    });
  }
}
