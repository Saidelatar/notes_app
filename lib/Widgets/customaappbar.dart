import 'package:flutter/material.dart';
import 'package:notes_app/Widgets/IconContainer.dart';

class CustomAppBar extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function()? onPressed;
  const CustomAppBar({super.key, required this.text, required this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        Spacer(),
        CustomContainer(
          onPressed: onPressed,
          icon: icon,
        ),
      ],
    );
  }
}
