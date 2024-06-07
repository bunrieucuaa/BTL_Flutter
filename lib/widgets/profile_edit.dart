import 'package:flutter/material.dart';
import 'package:flutter_btl/static/staticColor.dart';

class ProfileEdit extends StatelessWidget {
  final Widget widget;
  final String title;

  const ProfileEdit({
    super.key,
    required this.widget,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            title,
            style: const TextStyle(
              color: firstColor,
              fontSize: 18,
              fontFamily: "Poetsen One",
            ),
          ),
        ),
        const SizedBox(
          width: 30,
        ),
        Expanded(flex: 5, child: widget)
      ],
    );
  }
}
