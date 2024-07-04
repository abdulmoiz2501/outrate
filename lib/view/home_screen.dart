import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:out_rate/themes/colors.dart';
import 'package:out_rate/view/message_list_screen.dart';
import '../controllers/theme_controller.dart';
import '../widgets/custom_profile_card.dart';

class HomeScreen extends StatelessWidget {
  final void Function(int) onItemSelected;

  const HomeScreen({
    super.key,
    required this.onItemSelected,
  });
  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();

    final List<Map<String, dynamic>> profiles = [
      {
        'name': 'David Morel',
        'username': 'D_avid',
        'profileImageUrl': 'assets/images/dummy_profile_1.png',
        'imageUrls': [
          'assets/images/dummy_1.png',
          'assets/images/dummy_1.png',
          'assets/images/dummy_1.png',
          'assets/images/dummy_1.png',
        ],
        'likeCount': 4,
        'commentCount': 140,
        'isVerified': true,
      },
      {
        'name': 'Jessica Smith',
        'username': 'J_Smith',
        'profileImageUrl': 'assets/images/dummy_profile_2.png',
        'imageUrls': [
          'assets/images/dummy_2.png',
          'assets/images/dummy_2.png',
          'assets/images/dummy_2.png',
          'assets/images/dummy_2.png',
        ],
        'likeCount': 3,
        'commentCount': 120,
        'isVerified': false,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: lightBackgroundColor,
        //automaticallyImplyLeading: true,
        leadingWidth: 0,
        title: Row(
          children: [
            Image.asset(
              'assets/images/splash_1.png',
              height: 26.0,
              fit: BoxFit.contain,
            ),
            const SizedBox(width: 10),
            Image.asset(
              'assets/images/splash_2.png',
              height: 18.0,
              fit: BoxFit.contain,
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {
                // themeController.toggleTheme();
                Get.to(() => MessagesListScreen());
              },
              icon: const Icon(
                Icons.toggle_off,
                color: darkBackgroundColor,
              )),
          IconButton(
            icon: Image.asset(
              'assets/icons/icon_search.png',
              height: 32.0,
              fit: BoxFit.contain,
            ),
            onPressed: () {
              print('Search button pressed');
              onItemSelected(1);
            },
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: profiles.length,
        itemBuilder: (context, index) {
          final profile = profiles[index];
          return CustomProfileCard(
            name: profile['name'],
            username: profile['username'],
            profileImageUrl: profile['profileImageUrl'],
            imageUrls: List<String>.from(profile['imageUrls']),
            likeCount: profile['likeCount'],
            commentCount: profile['commentCount'],
            isVerified: profile['isVerified'],
            onActionPressed: () {
              // Handle action press
            },
          );
        },
      ),
    );
  }
}
