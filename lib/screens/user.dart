import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/dark_theme_provider.dart';
import '../widgets/text_widget.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final TextEditingController _addressTextController =
      TextEditingController(text: "");
  @override
  void dispose() {
    _addressTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 5,
                ),
                RichText(
                  text: TextSpan(
                    text: 'Hi, ',
                    style: const TextStyle(
                      color: Colors.cyan,
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: "My Name",
                        style: const TextStyle(
                          color: Colors.green,
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            print('My name');
                          },
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextWidget(
                  text: 'email@gmail.com',
                  color: color,
                  textSize: 16,
                  // isTitle: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Divider(
                  thickness: 2,
                ),
                const SizedBox(
                  height: 20,
                ),
                _listTiles(
                  title: 'Address 2',
                  subtitle: 'My subtitle',
                  icon: Icons.person_2_outlined,
                  onPressed: () async {
                    await _showAddressDialog();
                  },
                  color: color,
                ), //listTiles
                _listTiles(
                  title: 'Orders',
                  icon: Icons.shopping_bag_outlined,
                  onPressed: (event) => {},
                  color: color,
                ), //listTiles
                _listTiles(
                  title: 'WishList',
                  icon: Icons.add_alert_outlined,
                  onPressed: (event) => {},
                  color: color,
                ), //listTiles
                _listTiles(
                  title: 'Viewed',
                  icon: Icons.remove_red_eye_outlined,
                  onPressed: (event) => {},
                  color: color,
                ), //listTiles
                _listTiles(
                  title: 'Forgot Password',
                  icon: Icons.lock_open_rounded,
                  onPressed: (event) => {},
                  color: color,
                ), //listTiles
                _listTiles(
                  title: 'Logout',
                  icon: Icons.logout_outlined,
                  color: color,
                  onPressed: () async {
                    await _logoutDialog();
                  },
                ), //listTiles
                SwitchListTile(
                  title: TextWidget(
                    text: themeState.getDarkTheme ? "Dark" : "Light",
                    color: color,
                    textSize: 21,
                    // isTitle: true,
                  ),
                  secondary: Icon(themeState.getDarkTheme
                      ? Icons.dark_mode_outlined
                      : Icons.light_mode_outlined),
                  onChanged: (bool value) {
                    themeState.setDarkTheme = value;
                  },
                  value: themeState.getDarkTheme,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showAddressDialog() async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Update"),
            content: TextField(
              onChanged: (value) {
                // print(
                //   '_addressTextController.text ${_addressTextController.text}',
                // );
              },
              controller: _addressTextController,
              maxLines: 3,
              decoration: const InputDecoration(hintText: "Your address"),
            ),
            actions: [
              TextButton(
                onPressed: () {},
                child: const Text("Update"),
              )
            ],
          );
        });
  }

  Future<void> _logoutDialog() async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Row(
              children: const [
                Icon(Icons.logout_outlined),
                SizedBox(
                  width: 10,
                ),
                Text("Sign out"),
              ],
            ),
            content: const Text("Do you want to sign out?"),
            actions: [
              TextButton(
                onPressed: () {
                  if (Navigator.canPop(context)) {
                   Navigator.pop(context); 
                  }
                },
                child: TextWidget(
                  text: "cancel",
                  color: Colors.cyan,
                  textSize: 18,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: TextWidget(
                  text: "Ok",
                  color: Colors.red,
                  textSize: 18,
                ),
              ),
            ],
          );
        });
  }

  Widget _listTiles({
    required String title,
    String? subtitle,
    required IconData icon,
    required Function onPressed,
    required Color color,
  }) {
    return ListTile(
      title: TextWidget(
        text: title,
        color: color,
        textSize: 21,
        // isTitle: true,
      ),
      subtitle: TextWidget(
        text: subtitle ?? "",
        color: color,
        textSize: 18,
      ),
      leading: Icon(icon),
      trailing: const Icon(Icons.chevron_right_rounded),
      onTap: () {
        onPressed();
      },
    );
  }
}
