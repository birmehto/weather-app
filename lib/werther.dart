import 'package:flutter/material.dart';

class Werther extends StatelessWidget {
  final String date1;
  final IconData icon;
  final String label;

  // The constructor should have the correct super() call.
  const Werther({
    Key? key, // Added the correct key parameter
    required this.date1,
    required this.icon,
    required this.label,
  }) : super(key: key); // Added the super() call here

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Container(
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(6),
        child: Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            Text(
              date1,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 9,
            ),
            Icon(
              icon, // Use the provided icon parameter
              size: 20,
            ),
            const SizedBox(
              height: 9,
            ),
            Text(
              label, // Use the provided label parameter
            ),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
