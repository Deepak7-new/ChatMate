import 'services/chat_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Details extends StatelessWidget {
  Details(this._clickedName, this._username);
  final String _username;
  final String _clickedName;
  final ScrollController _controller = ScrollController();
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _controller.jumpTo(0.0));
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          title: Text(_clickedName,
              style: TextStyle(fontSize: 20, color: Colors.white)),
        ),
        body: Column(children: <Widget>[
          Flexible(
            child: Consumer<ChatService>(
              builder: (context, chatService, child) {
                chatService.getClickedUserMessages(_clickedName);
                if (chatService.requiredMessages == null) {
                  return _loadingWidget();
                } else {
                  return ListView.builder(
                      padding: EdgeInsets.only(bottom: 5.0),
                      reverse: true,
                      controller: _controller,
                      itemCount: chatService.requiredMessages.length,
                      itemBuilder: (BuildContext context, int index) {
                        return _message(context, index, chatService);
                      });
                }
              },
            ),
          ),
          Divider(height: 2.0),
          Container(
            height: 60,
            decoration: BoxDecoration(color: Theme.of(context).cardColor),
            child: _buildTextComposer(context),
          ),
        ]));
  }

  Widget _message(BuildContext context, int index, ChatService chatService) {
    index = chatService.requiredMessages.length - 1 - index;
    return Row(
      mainAxisAlignment: chatService.requiredMessages[index].from == _username
          ? MainAxisAlignment.start
          : MainAxisAlignment.end,
      children: <Widget>[
        Flexible(
          child: Container(
            child: Text(
              chatService.requiredMessages[index].rmsg,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
              overflow: TextOverflow.visible,
            ),
            padding: EdgeInsets.fromLTRB(7.0, 7.0, 7.0, 7.0),
            decoration: BoxDecoration(
              color: chatService.requiredMessages[index].from == _username
                  ? Colors.blueAccent
                  : Colors.yellowAccent,
              borderRadius: BorderRadius.circular(15.0),
            ),
            margin: EdgeInsets.only(right: 10.0, left: 10.0, top: 15.0),
          ),
        ),
      ],
    );
  }

  Widget _buildTextComposer(BuildContext context) {
    return IconTheme(
        data: IconThemeData(),
        child: Container(
          color: Theme.of(context).primaryColor,
          child: Row(children: <Widget>[
            Flexible(
              child: TextField(
                style: TextStyle(fontSize: 18, color: Colors.white),
                controller: _textController,
                onTap: () {
                  _controller.animateTo(0.0,
                      duration: Duration(milliseconds: 100),
                      curve: Curves.easeOut);
                },
                decoration: InputDecoration.collapsed(
                    hintText: " Send a message",
                    hintStyle: TextStyle(color: Colors.white, fontSize: 18)),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 6.0, vertical: 6.0),
              child: FloatingActionButton(
                child: Icon(
                  Icons.send,
                  color: Colors.white,
                ),
                onPressed: () => _submitted(context, _textController.text),
              ),
            ),
          ]),
        ));
  }

  Widget _loadingWidget() {
    return Container(
      child: Center(
        child: CircularProgressIndicator(
          value: null,
          strokeWidth: 3.0,
        ),
      ),
    );
  }

  void _submitted(BuildContext context, String text) {
    if (text == "" || text == null || text.replaceAll(" ", "").length == 0)
      return;
    Provider.of<ChatService>(context)
        .sendUserMessage(_username, _clickedName, text);
    _textController.clear();
  }
}
