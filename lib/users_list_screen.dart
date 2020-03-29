import 'package:chat_mate/setting_screen.dart';
import 'messages_screen.dart';
import 'services/chat_services.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class UsersPage extends StatefulWidget {
  UsersPage(this.userName, {Key key}) : super(key: key);

  final String userName;

  @override
  UsersPageState createState() => UsersPageState(userName);
}

class UsersPageState extends State<UsersPage> {
  final String userName;
  bool showSearch = false;
  UsersPageState(this.userName);
  @override
  void initState() {
    super.initState();
    Provider.of<ChatService>(context, listen: false).isLoggedIn = true;
    Provider.of<ChatService>(context, listen: false).repeat(userName);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Provider.of<ChatService>(context).reset();
        return true;
      },
      child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          appBar: AppBar(
            leading: Container(),
            actions: <Widget>[
              IconButton(
                icon: showSearch
                    ? Icon(
                        Icons.close,
                      )
                    : Icon(
                        Icons.search,
                      ),
                onPressed: _search,
              ),
              IconButton(
                  icon: Icon(Icons.more_vert),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SettingPage(),
                      ),
                    );
                  })
            ],
            title: showSearch
                ? TextField(
                    style: TextStyle(fontSize: 18, color: Colors.white),
                    onChanged: (text) {
                      Provider.of<ChatService>(context, listen: false)
                          .searchUser(text);
                    },
                    decoration: InputDecoration(
                        hintText: 'Search...',
                        hintStyle:
                            TextStyle(color: Colors.white, fontSize: 18)),
                  )
                : const Text('ChatMate',
                    style: TextStyle(fontSize: 22, color: Colors.white)),
          ),
          body: _showUsersList(context)),
    );
  }

  Widget _showUsersList(BuildContext context) {
    return Container(
      child: Consumer<ChatService>(
        builder: (context, chatService, child) {
          if (chatService.originalList == null ||
              chatService.allMessagesOfUser == null) {
            return _loadingWidget();
          } else {
            chatService.getSubtitleMessage();
            return ListView.separated(
              separatorBuilder: (context, index) =>
                  Divider(height: 6, color: Colors.white),
              itemCount: showSearch
                  ? chatService.searchList.length
                  : chatService.originalList.length,
              itemBuilder: (context, int index) {
                return ListTile(
                  leading: CircleAvatar(
                    radius: 30.0,
                    backgroundColor: Colors.blueAccent,
                    backgroundImage: AssetImage("assets/goku.jpeg"),
                  ),
                  title: Text(
                    showSearch
                        ? chatService.searchList[index]
                        : chatService.originalList[index],
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  trailing: Text(
                      (chatService.lastMessageAndTime[showSearch
                                  ? chatService.searchList[index]
                                  : chatService.originalList[index]] ??
                              [""])
                          .last,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      )),
                  subtitle: Text(
                      (chatService.lastMessageAndTime[showSearch
                                  ? chatService.searchList[index]
                                  : chatService.originalList[index]] ??
                              [""])
                          .first,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      )),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Details(
                          showSearch
                              ? chatService.searchList[index]
                              : chatService.originalList[index],
                          userName,
                        ),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
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

  void _search() {
    if (showSearch == true) {
      Provider.of<ChatService>(context, listen: false).searchUser("");
    }
    setState(() {
      showSearch = showSearch ? false : true;
    });
  }
}
