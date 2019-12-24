import 'package:chat_mate/services/chat_services.dart';
import 'package:chat_mate/services/theme_changer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeChanger>(builder: (context, chatService, child) {
      return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          title: Text(
            "Settings",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18),
          ),
        ),
        body: _settings(context),
      );
    });
  }

  Widget _settings(BuildContext context) {
    final bool isDarkMode = Provider.of<ThemeChanger>(context).isDarkMode;
    final List<bool> isSelected = [!isDarkMode, isDarkMode];
    return Container(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: const Text(
                    "Select Theme",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ToggleButtons(
                    borderRadius: BorderRadius.circular(100),
                    fillColor: Colors.white,
                    children: <Widget>[
                      CircleAvatar(
                        child: Image(
                          image: AssetImage("assets/sun.png"),
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: Theme.of(context).backgroundColor,
                        child: Image(
                          image: AssetImage("assets/moon.png"),
                        ),
                      ),
                    ],
                    onPressed: (int index) {
                      for (int buttonIndex = 0;
                          buttonIndex < isSelected.length;
                          buttonIndex++) {
                        if (buttonIndex == index) {
                          isSelected[buttonIndex] = true;
                          Provider.of<ThemeChanger>(context).setTheme(true);
                        } else {
                          isSelected[buttonIndex] = false;
                          Provider.of<ThemeChanger>(context).setTheme(false);
                        }
                      }
                    },
                    isSelected: isSelected,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: const Text(
                    "Logout",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.settings_power),
                  color: Colors.white,
                  onPressed: (){
                    Provider.of<ChatService>(context).reset();
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ]),
    );
  }
}
