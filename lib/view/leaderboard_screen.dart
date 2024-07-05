import 'package:flutter/material.dart';

import 'package:out_rate/themes/colors.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            size: 16,
            Icons.arrow_back_ios_new,
            color: darkBackgroundColor,
          ),
          onPressed: () {},
        ),
        title: const Text(
          'Leaderboard',
          style: TextStyle(color: darkBackgroundColor, fontSize: 19),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildProfile(
                    2, 'assets/images/dummy_1.png', 'Meghan Jessica', '4.5/5'),
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Column(
                      children: [
                        // Space for crown
                        _buildProfile(1, 'assets/images/dummy_2.png',
                            'Bryan Wolf', '5/5'),
                        SizedBox(height: 80),
                      ],
                    ),
                    Positioned(
                      top: -20,
                      child: Image.asset(
                        'assets/images/crown.png',
                        height: 40,
                        width: 40,
                      ),
                    ),
                  ],
                ),
                _buildProfile(3, 'assets/images/dummy_profile_1.png',
                    'Alex Turner', '4/5'),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildProfile(int rank, String imagePath, String name, String rating) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: primaryColor,
              child: CircleAvatar(
                radius: 36,
                backgroundImage: AssetImage(imagePath),
              ),
            ),
            Positioned(
              bottom: -10,
              child: Container(
                decoration: BoxDecoration(
                  color: primaryColor,
                  shape: BoxShape.circle,
                ),
                padding: EdgeInsets.all(4),
                child: Text(
                  '$rank',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Text(
          name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.star, color: primaryColor, size: 16),
            SizedBox(width: 4),
            Text(
              rating,
              style: TextStyle(
                color: primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
