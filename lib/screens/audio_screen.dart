import 'package:flutter/material.dart';
import 'package:country_icons/country_icons.dart';

class AudioScreen extends StatelessWidget {
  const AudioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 24,
            horizontal: 17,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Select your preferred language",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 20), // Added for spacing

              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: Colors.black54,
                    width: 1.0,
                  ),
                ),
                child: DropdownButton<String>(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  onChanged: (value) {},
                  borderRadius: BorderRadius.circular(8),
                  underline: Container(),
                  items: <String>[
                    'English',
                    'Japanese',
                    'French',
                    'Korean',
                    'Arabic'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Container(
                        width: 100,
                        child: Text(
                          // ekhane value bole  okkk r ekta
                          value,
                        ),
                      ),
                    );
                  }).toList(),
                  hint: const Text('Select an option'),
                ),
              ),

              SizedBox(height: 20), // Added for spacing

              Container(
                width: 400,
                height: 300,
                padding: EdgeInsets.only(left: 10.0),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  border: Border.all(
                    color: Colors.black,
                    width: 2, // ki
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 10,
                      left: 10,
                      child: Icon(
                        Icons.copy_all_sharp,
                        color: Colors.black38,
                        size: 34.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Hello, this is Akash Karmakar",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
