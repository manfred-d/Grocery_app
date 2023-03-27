import 'package:flutter/material.dart';
import 'package:grocery_app/services/utils.dart';

class HeartBtn extends StatelessWidget {
  const HeartBtn({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    return GestureDetector(
      onTap: () {
        print("liked");
      },
      child: Icon(
        Icons.favorite_border,
        size: 22,
        color: color,
      ),
    );
  }
}
