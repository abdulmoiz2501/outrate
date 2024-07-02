import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custom_asset_icon.dart';

class CustomProfileCard extends StatelessWidget {
  final String name;
  final String username;
  final String profileImageUrl;
  final List<String> imageUrls;
  final int likeCount;
  final int commentCount;
  final VoidCallback onActionPressed;

  const CustomProfileCard({
    Key? key,
    required this.name,
    required this.username,
    required this.profileImageUrl,
    required this.imageUrls,
    required this.likeCount,
    required this.commentCount,
    required this.onActionPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        child: Column(
          children: [
            ListTile(
              leading: Stack(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(profileImageUrl),
                    radius: 20, // Adjust the size as needed
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Image.asset(
                      'assets/icons/verified_icon.png',
                      width: 16, // Adjust the size as needed
                      height: 16, // Adjust the size as needed
                    ),
                  ),
                ],
              ),
              title: Text(
                name,
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                username,
                style: GoogleFonts.roboto(
                  color: Colors.grey,
                ),
              ),
              trailing: IconButton(
                icon: Image.asset(
                  'assets/icons/straight_action.png',
                  width: 30,
                  height: 30,
                ),
                onPressed: onActionPressed,
              ),
            ),
            CarouselSlider(
              options: CarouselOptions(
                height: 350,
                enlargeCenterPage: true,
                viewportFraction: 1.0,
                autoPlay: false,
              ),
              items: imageUrls.map((url) {
                return Builder(
                  builder: (BuildContext context) {
                    return Stack(
                      children: [
                        Image.asset(
                          url,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            height: 70,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  Colors.black.withOpacity(0.7),
                                ],
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: [
                                    AssetIcon(
                                        assetName: 'assets/icons/like_icon.png',
                                        color: Colors.white),
                                    SizedBox(width: 5),
                                    Text(
                                      '$likeCount/5',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    AssetIcon(
                                        assetName:
                                            'assets/icons/comment_icon.png',
                                        color: Colors.white),
                                    SizedBox(width: 5),
                                    Text(
                                      '$commentCount',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                                AssetIcon(
                                    assetName: 'assets/icons/share_icon.png',
                                    color: Colors.white),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(imageUrls.length, (index) {
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).primaryColor,
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
