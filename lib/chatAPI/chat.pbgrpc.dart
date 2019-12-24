///
//  Generated code. Do not modify.
//  source: chat.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'chat.pb.dart' as $0;
export 'chat.pb.dart';

class ChatsClient extends $grpc.Client {
  static final _$join = $grpc.ClientMethod<$0.SendJoin, $0.GetJoin>(
      '/chat.Chats/Join',
      ($0.SendJoin value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetJoin.fromBuffer(value));
  static final _$send = $grpc.ClientMethod<$0.SendMessage, $0.GetMessage>(
      '/chat.Chats/Send',
      ($0.SendMessage value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetMessage.fromBuffer(value));
  static final _$message =
      $grpc.ClientMethod<$0.SendAllMessage, $0.GetAllMessage>(
          '/chat.Chats/Message',
          ($0.SendAllMessage value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.GetAllMessage.fromBuffer(value));
  static final _$users = $grpc.ClientMethod<$0.SendUsers, $0.GetUsers>(
      '/chat.Chats/Users',
      ($0.SendUsers value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetUsers.fromBuffer(value));

  ChatsClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<$0.GetJoin> join($0.SendJoin request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$join, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.GetMessage> send($0.SendMessage request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$send, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.GetAllMessage> message($0.SendAllMessage request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$message, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.GetUsers> users($0.SendUsers request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$users, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }
}

abstract class ChatsServiceBase extends $grpc.Service {
  $core.String get $name => 'chat.Chats';

  ChatsServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.SendJoin, $0.GetJoin>(
        'Join',
        join_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SendJoin.fromBuffer(value),
        ($0.GetJoin value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SendMessage, $0.GetMessage>(
        'Send',
        send_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SendMessage.fromBuffer(value),
        ($0.GetMessage value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SendAllMessage, $0.GetAllMessage>(
        'Message',
        message_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SendAllMessage.fromBuffer(value),
        ($0.GetAllMessage value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SendUsers, $0.GetUsers>(
        'Users',
        users_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SendUsers.fromBuffer(value),
        ($0.GetUsers value) => value.writeToBuffer()));
  }

  $async.Future<$0.GetJoin> join_Pre(
      $grpc.ServiceCall call, $async.Future<$0.SendJoin> request) async {
    return join(call, await request);
  }

  $async.Future<$0.GetMessage> send_Pre(
      $grpc.ServiceCall call, $async.Future<$0.SendMessage> request) async {
    return send(call, await request);
  }

  $async.Future<$0.GetAllMessage> message_Pre(
      $grpc.ServiceCall call, $async.Future<$0.SendAllMessage> request) async {
    return message(call, await request);
  }

  $async.Future<$0.GetUsers> users_Pre(
      $grpc.ServiceCall call, $async.Future<$0.SendUsers> request) async {
    return users(call, await request);
  }

  $async.Future<$0.GetJoin> join($grpc.ServiceCall call, $0.SendJoin request);
  $async.Future<$0.GetMessage> send(
      $grpc.ServiceCall call, $0.SendMessage request);
  $async.Future<$0.GetAllMessage> message(
      $grpc.ServiceCall call, $0.SendAllMessage request);
  $async.Future<$0.GetUsers> users(
      $grpc.ServiceCall call, $0.SendUsers request);
}
