import 'package:flutter/material.dart';

class TransCodeBanner extends StatelessWidget {
  const TransCodeBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.yellow[50],
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.yellow[700]!,
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Now translate language\nusing your camera',
              style: TextStyle(
                color: Colors.black,
                fontSize: 11,
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            const Text(
              'Scan to \nTranscode',
              style: TextStyle(
                color: Color.fromARGB(255, 159, 108, 252),
                fontSize: 20,
                fontWeight: FontWeight.w600,
                letterSpacing: 0,
                height: 1.2,
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            FilledButton(
              onPressed: () {},
              style: FilledButton.styleFrom(
                backgroundColor: Colors.amber[300],
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(14),
                  ),
                ),
              ),
              child: const Text(
                'Try Now',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
