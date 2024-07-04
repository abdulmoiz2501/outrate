import 'package:flutter/material.dart';
import 'package:out_rate/themes/colors.dart';

class SearchScreen extends StatefulWidget {
  final void Function(int) onItemSelected;

  const SearchScreen({
    super.key,
    required this.onItemSelected,
  });

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<String> recentSearches = [
    "The artist guy",
    "The artist guy",
    "The artist guy",
    "The artist guy",
    "The artist guy",
    "The artist guy",
    "The artist guy",
  ];

  void _removeItem(int index) {
    setState(() {
      recentSearches.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Returning false disables the back button
        return false;
      },
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: IconButton(
              icon: const Icon(
                size: 16,
                Icons.arrow_back_ios_new,
                color: darkBackgroundColor,
              ),
              onPressed: () {
                widget.onItemSelected(0);
              },
            ),
            title: const Text(
              'Search',
              style: TextStyle(color: darkBackgroundColor, fontSize: 19),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    // prefixIcon: Icon(Icons.search),
                    suffixIcon: Image.asset(
                      'assets/icons/icon_search.png',

                      // fit: BoxFit.cover,
                    ),
                    suffixIconConstraints:
                        const BoxConstraints(maxHeight: 24, maxWidth: 24),

                    filled: true,
                    fillColor: Color(0xFF9797BD).withOpacity(0.15),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: BorderSide(
                        color: Colors.transparent, // default border color
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: BorderSide(
                        color: Colors.transparent, // default border color
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Recent',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: darkBackgroundColor,
                        ),
                      ),
                      Text(
                        'See All',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: recentSearches.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        contentPadding: EdgeInsets.symmetric(horizontal: 16)
                            .copyWith(right: 0),
                        leading: CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/dummy_1.png'),
                        ),
                        title: Text(recentSearches[index]),
                        trailing: IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () {
                            _removeItem(index);
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
