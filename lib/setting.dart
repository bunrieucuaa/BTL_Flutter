import 'package:flutter/material.dart';
import 'package:flutter_btl/static/staticColor.dart';
import 'package:flutter_btl/widgets/forward_button.dart';
import 'package:flutter_btl/widgets/setting_item.dart';
import 'package:flutter_btl/widgets/setting_switch.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Settings",
              style: TextStyle(
                  color: firstColor,
                  fontSize: 36,
                  fontFamily: "Poetsen One",
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              "Account",
              style: TextStyle(
                  color: firstColor,
                  fontSize: 27,
                  fontFamily: "Poetsen One",
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: Row(
                children: [
                  Image.asset(
                    "assets/avatar.png",
                    width: 70,
                    height: 70,
                  ),
                  const SizedBox(width: 20),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Nguyễn Việt An",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "DCCTCLC66A1",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  ForwardButton(
                    onTapCheck: () {},
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              "Settings",
              style: TextStyle(
                  color: firstColor,
                  fontSize: 27,
                  fontFamily: "Poetsen One",
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 20,
            ),
            SettingItem(
              settingType: "Language",
              valueSetting: "English",
              icon: Icons.language,
              bgColor: bgLanguageColor,
              iconColor: iconLanguageColor,
              onTap: () {},
            ),
            const SizedBox(
              height: 10,
            ),
            SettingItem(
              settingType: "Notification",
              valueSetting: "",
              icon: Icons.notifications,
              bgColor: bgNotificationColor,
              iconColor: iconNotificationColor,
              onTap: () {},
            ),
            const SizedBox(
              height: 10,
            ),
            SettingSwitch(
              settingType: "Dark Mode",
              valueSetting: isDarkMode,
              icon: Icons.dark_mode,
              bgColor: bgDarkModeColor,
              iconColor: iconDarkModeColor,
              onTap: (valueSetting) {
                setState(() {
                  isDarkMode = valueSetting;
                });
              },
            ),
            const SizedBox(
              height: 10,
            ),
            SettingItem(
              settingType: "Helps",
              valueSetting: "",
              icon: Icons.help,
              bgColor: bgHelpColor,
              iconColor: iconHelpColor,
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
