import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 246, 239, 247),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(22)),
      ),
      child: const Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18, vertical: 28),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 171, 134, 241),
                  child: Icon(
                    Icons.emoji_people_sharp,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome back",
                      style: TextStyle(
                        color: Color.fromARGB(255, 171, 134, 241),
                      ),
                    ),
                    SizedBox(
                      height: 1,
                    ),
                    Text(
                      "Akash Karmakar",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 171, 134, 241),
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: Icon(Icons.search),
                focusColor: Colors.white,
                hintText: "Search for language",
                hintStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
                fillColor: Colors.white,
                filled: true,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
