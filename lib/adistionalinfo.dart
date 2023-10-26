import 'package:flutter/material.dart';

class Adistionalinfo extends StatelessWidget {
  final IconData icon;
  final String lable;
  final String value;

  const Adistionalinfo({
    super.key,
    required this.icon,
    required this.lable,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        Icon(
          icon,
          size: 25,
        ),
        // ignore: prefer_const_constructors
        const SizedBox(
          height: 8,
        ), 
        Text(lable),
        const SizedBox(
          height: 8,
        ),
        Text(value)
      ],
    );
  }
}
