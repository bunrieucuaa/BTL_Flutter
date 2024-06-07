import 'package:flutter/material.dart';
import 'package:flutter_btl/static/staticColor.dart';
import 'package:flutter_btl/widgets/profile_edit.dart';

class AccountHomePage extends StatefulWidget {
  const AccountHomePage({super.key});

  @override
  State<AccountHomePage> createState() => _AccountHomePageState();
}

class _AccountHomePageState extends State<AccountHomePage> {
  String gender = "Male";
  late TextEditingController ageInitValue;
  late TextEditingController nameInitValue;
  late TextEditingController emailInitValue;

  @override
  void initState() {
    super.initState();
    nameInitValue = TextEditingController(text: 'Nguyễn Việt An');
    ageInitValue = TextEditingController(text: '21');
    emailInitValue = TextEditingController(text: 'ann71576@gmail.com');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 25, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Account",
                style: TextStyle(
                    color: firstColor,
                    fontSize: 36,
                    fontFamily: "Poetsen One",
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 40,
              ),
              ProfileEdit(
                title: "Photo",
                widget: Column(
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          "assets/avatar.png",
                          width: 100,
                          height: 100,
                        ),
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                              foregroundColor: secondColor),
                          child: const Text("Upload Image"),
                        )
                      ],
                    )
                  ],
                ),
              ),
              ProfileEdit(
                title: "Name",
                widget: TextField(
                  controller: nameInitValue,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              ProfileEdit(
                title: "Gender",
                widget: Row(children: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          gender = "Male";
                        });
                      },
                      style: IconButton.styleFrom(
                          backgroundColor:
                              gender == "Male" ? whenMale : whenFemale,
                          fixedSize: const Size(50, 50)),
                      icon: Icon(
                        Icons.male,
                        color: gender == "Male" ? whenMaleText : whenFemaleText,
                        size: 18,
                      )),
                  const SizedBox(width: 40),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          gender = "Female";
                        });
                      },
                      style: IconButton.styleFrom(
                          backgroundColor:
                              gender == "Female" ? whenMale : whenFemale,
                          fixedSize: const Size(50, 50)),
                      icon: Icon(
                        Icons.female,
                        color:
                            gender == "Female" ? whenMaleText : whenFemaleText,
                        size: 18,
                      )),
                ]),
              ),
              const SizedBox(
                height: 40,
              ),
              ProfileEdit(
                title: "Age",
                widget: TextField(
                  controller: ageInitValue,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              ProfileEdit(
                title: "Email",
                widget: TextField(
                  controller: emailInitValue,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
