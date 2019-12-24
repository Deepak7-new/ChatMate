import 'package:chat_mate/services/chat_services.dart';
import 'package:chat_mate/users_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Join Chat',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  color: Colors.white),
            ),
            Divider(
              height: 20,
            ),
            Container(
              height: 60,
              decoration:
                  BoxDecoration(color: Theme.of(context).backgroundColor),
              child: _enterNameComposer(context),
            ),
            Divider(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: ButtonTheme(
                minWidth: 350,
                height: 45,
                child: RaisedButton(
                  elevation: 15,
                  child: Text(
                    'Join',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  color: Colors.blueAccent,
                  onPressed: () => _joinUser(context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _enterNameComposer(BuildContext context) {
    return IconTheme(
        data: IconThemeData(),
        child: Container(
          margin: EdgeInsets.only(left: 30, right: 30, bottom: 5),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.blueAccent, width: 2),
              borderRadius: BorderRadius.circular(30)),
          padding: EdgeInsets.only(right: 8, left: 8),
          child: TextField(
            style: TextStyle(fontSize: 18, color: Colors.white),
            controller: _textController,
            decoration: InputDecoration.collapsed(
                hintText: "Enter Name",
                hintStyle: TextStyle(color: Colors.white, fontSize: 18)),
          ),
        ));
  }

  void _joinUser(BuildContext context) {
    if (_textController.text == null ||
        _textController.text.replaceAll(" ", "").length == 0) return;
    Provider.of<ChatService>(context, listen: false).join(_textController.text);
    Provider.of<ChatService>(context, listen: false)
        .getAllUsers(_textController.text);
    Provider.of<ChatService>(context, listen: false)
        .getAllUserMessages(_textController.text);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => UsersPage(_textController.text)),
    );
  }
}
