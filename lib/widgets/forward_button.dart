import 'package:flutter/material.dart';

class ForwardButton extends StatelessWidget {
  final Function() onTapCheck;
  const ForwardButton({super.key, required this.onTapCheck});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapCheck,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(15)),
        child: const Icon(
          Icons.chevron_right_outlined,
        ),
      ),
    );
  }
}
