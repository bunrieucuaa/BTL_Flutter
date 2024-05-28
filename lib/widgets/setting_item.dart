import 'package:flutter/material.dart';
import 'package:flutter_btl/widgets/forward_button.dart';

class SettingItem extends StatelessWidget {
  final String settingType;
  final String? valueSetting;
  final Color bgColor;
  final Color iconColor;
  final IconData icon;
  final Function() onTap;

  const SettingItem({
    super.key,
    required this.settingType,
    required this.bgColor,
    required this.iconColor,
    required this.icon,
    required this.onTap,
    this.valueSetting,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: bgColor,
            ),
            child: Icon(icon, color: iconColor),
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            settingType,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const Spacer(),
          valueSetting != null
              ? Text(
                  valueSetting!,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey),
                )
              : const SizedBox(),
          const SizedBox(
            width: 20,
          ),
          ForwardButton(
            onTapCheck: onTap,
          )
        ],
      ),
    );
  }
}
