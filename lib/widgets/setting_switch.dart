import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingSwitch extends StatelessWidget {
  final String settingType;
  final bool valueSetting;
  final Color bgColor;
  final Color iconColor;
  final IconData icon;
  final Function(bool valueSetting) onTap;

  const SettingSwitch({
    super.key,
    required this.settingType,
    required this.bgColor,
    required this.iconColor,
    required this.icon,
    required this.onTap,
    required this.valueSetting,
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
          Text(
            valueSetting ? "On" : "Off",
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.w500, color: Colors.grey),
          ),
          const SizedBox(
            width: 20,
          ),
          CupertinoSwitch(value: valueSetting, onChanged: onTap)
        ],
      ),
    );
  }
}
