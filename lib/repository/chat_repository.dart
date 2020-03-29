import 'package:chat_mate/model/messages.dart';
import 'package:chat_mate/model/users.dart';
import 'dart:async';
import 'package:grpc/grpc.dart';
import 'package:chat_mate/chatAPI/chat.pbgrpc.dart';

abstract class AbstractChatRepository {
  Future<Users> fetchUsers(String currentUserName);
  Future<Messages> fetchAllMessages(String currentUserName);
  Future<void> postMessages(String sender, String receiver, String message);
  void join(String name);
}
class ChatRepository extends AbstractChatRepository {
  static final channel = ClientChannel(
    '10.0.2.2',//'127.0.0.1',
    port: 8080,
    options: const ChannelOptions(
      credentials: ChannelCredentials.insecure(),
    ),
  );
  static final stub = ChatsClient(channel);

  @override
  Future<Users> fetchUsers(String currentUserName) async {
    List<String> usersList = [];
    try {
      final response = await stub.users(new SendUsers());
      for (int i = 0; i < response.names.length; i++) {
        if (response.names[i] == currentUserName)
          continue;
        else {
          usersList.add(response.names[i]);
        }
      }
    } catch (e) {
      print(e);
      throw NetworkError();
    }
    return Users(usersList);
  }

  @override
  Future<void> postMessages(
      String sender, String receiver, String message) async {
    try {
      await stub.send(new SendMessage()
        ..from = sender
        ..to = receiver
        ..smsg = message);
    } catch (e) {
      print('Caught error: $e');
      throw NetworkError();
    }
  }

  @override
  Future<Messages> fetchAllMessages(String currentUserName) async {
    try {
      final response =
          await stub.message(new SendAllMessage()..usr = currentUserName);
      return Messages(response.msgs);
    } catch (e) {
      print('Caught error: $e');
      throw NetworkError();
    }
  }

  @override
  void join(String name) {
    try{
      stub.join(new SendJoin()..name = name);
    }catch (e){
      print('Caught error: $e');
    }
  }
}

class NetworkError extends Error {}
