import 'package:flutter/material.dart';

class TransAudioBanner extends StatelessWidget {
  const TransAudioBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 18,
      ),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 239, 244),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.pink[200]!,
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 18,
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(23),
              ),
            ),
            child: Column(
              children: [
                Text(
                  "1:1",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.pink[300],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Talk",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.pink[300],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const Text(
            "Spoken English",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 2.0, // Adjust outline thickness
                  ),
                ),
                child: const CircleAvatar(
                  backgroundImage: AssetImage("assets/image.png"),
                ),
              ),
              const Icon(
                Icons.arrow_forward_outlined,
              ),
            ],
          )
        ],
      ),
    );
  }
}
