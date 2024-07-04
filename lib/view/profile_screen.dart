import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:out_rate/themes/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Icon(
          Icons.menu,
          color: darkBackgroundColor,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_horiz,
              color: darkBackgroundColor,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      '300K',
                      style: GoogleFonts.roboto(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text('Followers'),
                  ],
                ),
                Column(
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/images/dummy_1.png'),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Brian David',
                      style: GoogleFonts.roboto(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Bio Description here',
                      style: GoogleFonts.roboto(),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '130',
                      style: GoogleFonts.roboto(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text('Following'),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Edit Profile'),
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: Text('Share'),
                ),
              ],
            ),
            SizedBox(height: 20),
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
                childAspectRatio: 1,
              ),
              itemCount: 8,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return GridTile(
                    child: Container(
                      color: Colors.blue,
                      child: Image.network(
                        'https://via.placeholder.com/300',
                        fit: BoxFit.cover,
                      ),
                    ),
                    footer: GridTileBar(
                      backgroundColor: Colors.black54,
                      title: Text('Big Image'),
                    ),
                  );
                } else {
                  return Container(
                    color: Colors.blue,
                    child: Image.network(
                      'https://via.placeholder.com/150',
                      fit: BoxFit.cover,
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
