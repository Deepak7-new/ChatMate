import 'package:chat_mate/chatAPI/chat.pb.dart';
import 'package:chat_mate/repository/chat_repository.dart';
import 'package:flutter/cupertino.dart';

class ChatService extends ChangeNotifier {
  final AbstractChatRepository chatRepository = ChatRepository();
  List<String> searchList, originalList;
  List<GetMessage> allMessagesOfUser, requiredMessages;
  bool isLoggedIn = false;
  Map<String, List<String>> lastMessageAndTime;

  void getAllUsers(String currentUserName) async {
    try {
      final response = await chatRepository.fetchUsers(currentUserName);
      if (response.users.length > (originalList ?? []).length) {
        searchList = originalList = response.users;
        notifyListeners();
      }
    } on Error {
      print("Error at retrieving users !!");
    }
  }

  void getClickedUserMessages(String clickedUserName) {
    if (allMessagesOfUser == null) {
      return;
    }
    requiredMessages = [];
    for (int i = 0; i < allMessagesOfUser.length; i++) {
      if (allMessagesOfUser[i].to == clickedUserName ||
          allMessagesOfUser[i].from == clickedUserName) {
        requiredMessages.add(allMessagesOfUser[i]);
      }
    }
  }

  void getAllUserMessages(String currentUserName) async {
    try {
      final response = await chatRepository.fetchAllMessages(currentUserName);
      allMessagesOfUser = allMessagesOfUser ?? [];
      if (response.messages.length > allMessagesOfUser.length) {
        allMessagesOfUser = response.messages;
        notifyListeners();
      }
    } on Error {
      print("Couldn't fetch messages. Is the device online?");
    }
  }

  void searchUser(String searchText) {
    List<String> tempList = [];
    searchList = originalList ?? [];
    if (searchText != null) {
      for (int i = 0; i < searchList.length; i++) {
        if (searchList[i].contains(searchText)) {
          tempList.add(searchList[i]);
        }
      }
      searchList = tempList;
      notifyListeners();
    }
  }

  void sendUserMessage(String sender, String receiver, String message) async {
    try {
      await chatRepository.postMessages(sender, receiver, message);
      notifyListeners();
    } on Error {
      print("Couldn't send message. Is the device online?");
    }
  }

  void join(String name) {
    chatRepository.join(name);
  }

  void getSubtitleMessage() {
    if (allMessagesOfUser == null || originalList == null) {
      return;
    }
    lastMessageAndTime = {};
    for (String user in originalList) {
      lastMessageAndTime.putIfAbsent(user, () => [" "]);
    }
    for (int i = 0; i < allMessagesOfUser.length; i++) {
      if (lastMessageAndTime.containsKey(allMessagesOfUser[i].to)) {
        lastMessageAndTime[allMessagesOfUser[i].to] = [
          allMessagesOfUser[i].rmsg,
          allMessagesOfUser[i].time.split(" ").first
        ];
      }
      if (lastMessageAndTime.containsKey(allMessagesOfUser[i].from)) {
        lastMessageAndTime[allMessagesOfUser[i].from] = [
          allMessagesOfUser[i].rmsg,
          allMessagesOfUser[i].time.split(" ").first
        ];
      }
    }
  }

  void repeat(String currentUserName) async {
    while (isLoggedIn) {
      await Future.delayed(const Duration(seconds: 1), () {
        if (!isLoggedIn) return;
        getAllUsers(currentUserName);
        getAllUserMessages(currentUserName);
      });
    }
  }

  void reset() {
    isLoggedIn = false;
    searchList = originalList = null;
    allMessagesOfUser = requiredMessages = null;
    print(isLoggedIn);
  }
}
