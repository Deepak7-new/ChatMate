///
//  Generated code. Do not modify.
//  source: chat.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class SendJoin extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('SendJoin', package: const $pb.PackageName('chat'), createEmptyInstance: create)
    ..aOS(1, 'name')
    ..hasRequiredFields = false
  ;

  SendJoin._() : super();
  factory SendJoin() => create();
  factory SendJoin.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SendJoin.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  SendJoin clone() => SendJoin()..mergeFromMessage(this);
  SendJoin copyWith(void Function(SendJoin) updates) => super.copyWith((message) => updates(message as SendJoin));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SendJoin create() => SendJoin._();
  SendJoin createEmptyInstance() => create();
  static $pb.PbList<SendJoin> createRepeated() => $pb.PbList<SendJoin>();
  @$core.pragma('dart2js:noInline')
  static SendJoin getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SendJoin>(create);
  static SendJoin _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);
}

class GetJoin extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetJoin', package: const $pb.PackageName('chat'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  GetJoin._() : super();
  factory GetJoin() => create();
  factory GetJoin.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetJoin.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GetJoin clone() => GetJoin()..mergeFromMessage(this);
  GetJoin copyWith(void Function(GetJoin) updates) => super.copyWith((message) => updates(message as GetJoin));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetJoin create() => GetJoin._();
  GetJoin createEmptyInstance() => create();
  static $pb.PbList<GetJoin> createRepeated() => $pb.PbList<GetJoin>();
  @$core.pragma('dart2js:noInline')
  static GetJoin getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetJoin>(create);
  static GetJoin _defaultInstance;
}

class SendMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('SendMessage', package: const $pb.PackageName('chat'), createEmptyInstance: create)
    ..aOS(1, 'from')
    ..aOS(2, 'to')
    ..aOS(3, 'smsg')
    ..hasRequiredFields = false
  ;

  SendMessage._() : super();
  factory SendMessage() => create();
  factory SendMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SendMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  SendMessage clone() => SendMessage()..mergeFromMessage(this);
  SendMessage copyWith(void Function(SendMessage) updates) => super.copyWith((message) => updates(message as SendMessage));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SendMessage create() => SendMessage._();
  SendMessage createEmptyInstance() => create();
  static $pb.PbList<SendMessage> createRepeated() => $pb.PbList<SendMessage>();
  @$core.pragma('dart2js:noInline')
  static SendMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SendMessage>(create);
  static SendMessage _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get from => $_getSZ(0);
  @$pb.TagNumber(1)
  set from($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFrom() => $_has(0);
  @$pb.TagNumber(1)
  void clearFrom() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get to => $_getSZ(1);
  @$pb.TagNumber(2)
  set to($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTo() => $_has(1);
  @$pb.TagNumber(2)
  void clearTo() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get smsg => $_getSZ(2);
  @$pb.TagNumber(3)
  set smsg($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSmsg() => $_has(2);
  @$pb.TagNumber(3)
  void clearSmsg() => clearField(3);
}

class GetMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetMessage', package: const $pb.PackageName('chat'), createEmptyInstance: create)
    ..aInt64(1, 'id')
    ..aOS(2, 'from')
    ..aOS(3, 'to')
    ..aOS(4, 'rmsg')
    ..aOS(5, 'time')
    ..hasRequiredFields = false
  ;

  GetMessage._() : super();
  factory GetMessage() => create();
  factory GetMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GetMessage clone() => GetMessage()..mergeFromMessage(this);
  GetMessage copyWith(void Function(GetMessage) updates) => super.copyWith((message) => updates(message as GetMessage));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetMessage create() => GetMessage._();
  GetMessage createEmptyInstance() => create();
  static $pb.PbList<GetMessage> createRepeated() => $pb.PbList<GetMessage>();
  @$core.pragma('dart2js:noInline')
  static GetMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetMessage>(create);
  static GetMessage _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get from => $_getSZ(1);
  @$pb.TagNumber(2)
  set from($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFrom() => $_has(1);
  @$pb.TagNumber(2)
  void clearFrom() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get to => $_getSZ(2);
  @$pb.TagNumber(3)
  set to($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTo() => $_has(2);
  @$pb.TagNumber(3)
  void clearTo() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get rmsg => $_getSZ(3);
  @$pb.TagNumber(4)
  set rmsg($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasRmsg() => $_has(3);
  @$pb.TagNumber(4)
  void clearRmsg() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get time => $_getSZ(4);
  @$pb.TagNumber(5)
  set time($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearTime() => clearField(5);
}

class SendAllMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('SendAllMessage', package: const $pb.PackageName('chat'), createEmptyInstance: create)
    ..aOS(1, 'usr')
    ..hasRequiredFields = false
  ;

  SendAllMessage._() : super();
  factory SendAllMessage() => create();
  factory SendAllMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SendAllMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  SendAllMessage clone() => SendAllMessage()..mergeFromMessage(this);
  SendAllMessage copyWith(void Function(SendAllMessage) updates) => super.copyWith((message) => updates(message as SendAllMessage));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SendAllMessage create() => SendAllMessage._();
  SendAllMessage createEmptyInstance() => create();
  static $pb.PbList<SendAllMessage> createRepeated() => $pb.PbList<SendAllMessage>();
  @$core.pragma('dart2js:noInline')
  static SendAllMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SendAllMessage>(create);
  static SendAllMessage _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get usr => $_getSZ(0);
  @$pb.TagNumber(1)
  set usr($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUsr() => $_has(0);
  @$pb.TagNumber(1)
  void clearUsr() => clearField(1);
}

class GetAllMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetAllMessage', package: const $pb.PackageName('chat'), createEmptyInstance: create)
    ..pc<GetMessage>(1, 'msgs', $pb.PbFieldType.PM, subBuilder: GetMessage.create)
    ..hasRequiredFields = false
  ;

  GetAllMessage._() : super();
  factory GetAllMessage() => create();
  factory GetAllMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetAllMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GetAllMessage clone() => GetAllMessage()..mergeFromMessage(this);
  GetAllMessage copyWith(void Function(GetAllMessage) updates) => super.copyWith((message) => updates(message as GetAllMessage));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetAllMessage create() => GetAllMessage._();
  GetAllMessage createEmptyInstance() => create();
  static $pb.PbList<GetAllMessage> createRepeated() => $pb.PbList<GetAllMessage>();
  @$core.pragma('dart2js:noInline')
  static GetAllMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetAllMessage>(create);
  static GetAllMessage _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<GetMessage> get msgs => $_getList(0);
}

class SendUsers extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('SendUsers', package: const $pb.PackageName('chat'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  SendUsers._() : super();
  factory SendUsers() => create();
  factory SendUsers.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SendUsers.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  SendUsers clone() => SendUsers()..mergeFromMessage(this);
  SendUsers copyWith(void Function(SendUsers) updates) => super.copyWith((message) => updates(message as SendUsers));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SendUsers create() => SendUsers._();
  SendUsers createEmptyInstance() => create();
  static $pb.PbList<SendUsers> createRepeated() => $pb.PbList<SendUsers>();
  @$core.pragma('dart2js:noInline')
  static SendUsers getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SendUsers>(create);
  static SendUsers _defaultInstance;
}

class GetUsers extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetUsers', package: const $pb.PackageName('chat'), createEmptyInstance: create)
    ..pPS(1, 'names')
    ..hasRequiredFields = false
  ;

  GetUsers._() : super();
  factory GetUsers() => create();
  factory GetUsers.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetUsers.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GetUsers clone() => GetUsers()..mergeFromMessage(this);
  GetUsers copyWith(void Function(GetUsers) updates) => super.copyWith((message) => updates(message as GetUsers));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetUsers create() => GetUsers._();
  GetUsers createEmptyInstance() => create();
  static $pb.PbList<GetUsers> createRepeated() => $pb.PbList<GetUsers>();
  @$core.pragma('dart2js:noInline')
  static GetUsers getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetUsers>(create);
  static GetUsers _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get names => $_getList(0);
}

