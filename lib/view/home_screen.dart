import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/theme_controller.dart';
import '../widgets/custom_profile_card.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        actions: [
          IconButton(
            onPressed: () {
              themeController.toggleTheme();
            },
            icon: Icon(Icons.toggle_off_rounded),
          ),
        ],
      ),


      body: CustomProfileCard(
          name: 'David Morel',
          username: 'D_avid',
          profileImageUrl: 'assets/images/dummy_profile_1.png',
          imageUrls: [
            'assets/images/dummy_1.png',
            'assets/images/dummy_1.png',
            'assets/images/dummy_1.png',
            'assets/images/dummy_1.png',
          ],
          likeCount: 4,
          commentCount: 140,
          onActionPressed: () {
            // Handle action press
          },
      ),
    );
  }
}
