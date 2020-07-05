///
//  Generated code. Do not modify.
//  source: protos/mdsflutter.proto
//
// @dart = 2.3
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class RequestResult extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('RequestResult', createEmptyInstance: create)
    ..a<$core.int>(1, 'requestId', $pb.PbFieldType.O3, protoName: 'requestId')
    ..a<$core.int>(2, 'statusCode', $pb.PbFieldType.O3, protoName: 'statusCode')
    ..aOS(3, 'data')
    ..hasRequiredFields = false
  ;

  RequestResult._() : super();
  factory RequestResult() => create();
  factory RequestResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RequestResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  RequestResult clone() => RequestResult()..mergeFromMessage(this);
  RequestResult copyWith(void Function(RequestResult) updates) => super.copyWith((message) => updates(message as RequestResult));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RequestResult create() => RequestResult._();
  RequestResult createEmptyInstance() => create();
  static $pb.PbList<RequestResult> createRepeated() => $pb.PbList<RequestResult>();
  @$core.pragma('dart2js:noInline')
  static RequestResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RequestResult>(create);
  static RequestResult _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get requestId => $_getIZ(0);
  @$pb.TagNumber(1)
  set requestId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRequestId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRequestId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get statusCode => $_getIZ(1);
  @$pb.TagNumber(2)
  set statusCode($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasStatusCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatusCode() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get data => $_getSZ(2);
  @$pb.TagNumber(3)
  set data($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
}

class RequestError extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('RequestError', createEmptyInstance: create)
    ..a<$core.int>(1, 'requestId', $pb.PbFieldType.O3, protoName: 'requestId')
    ..a<$core.int>(2, 'statusCode', $pb.PbFieldType.O3, protoName: 'statusCode')
    ..aOS(3, 'error')
    ..hasRequiredFields = false
  ;

  RequestError._() : super();
  factory RequestError() => create();
  factory RequestError.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RequestError.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  RequestError clone() => RequestError()..mergeFromMessage(this);
  RequestError copyWith(void Function(RequestError) updates) => super.copyWith((message) => updates(message as RequestError));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RequestError create() => RequestError._();
  RequestError createEmptyInstance() => create();
  static $pb.PbList<RequestError> createRepeated() => $pb.PbList<RequestError>();
  @$core.pragma('dart2js:noInline')
  static RequestError getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RequestError>(create);
  static RequestError _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get requestId => $_getIZ(0);
  @$pb.TagNumber(1)
  set requestId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRequestId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRequestId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get statusCode => $_getIZ(1);
  @$pb.TagNumber(2)
  set statusCode($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasStatusCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatusCode() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get error => $_getSZ(2);
  @$pb.TagNumber(3)
  set error($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasError() => $_has(2);
  @$pb.TagNumber(3)
  void clearError() => clearField(3);
}

class Notification extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Notification', createEmptyInstance: create)
    ..a<$core.int>(1, 'subscriptionId', $pb.PbFieldType.O3, protoName: 'subscriptionId')
    ..aOS(2, 'data')
    ..hasRequiredFields = false
  ;

  Notification._() : super();
  factory Notification() => create();
  factory Notification.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Notification.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Notification clone() => Notification()..mergeFromMessage(this);
  Notification copyWith(void Function(Notification) updates) => super.copyWith((message) => updates(message as Notification));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Notification create() => Notification._();
  Notification createEmptyInstance() => create();
  static $pb.PbList<Notification> createRepeated() => $pb.PbList<Notification>();
  @$core.pragma('dart2js:noInline')
  static Notification getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Notification>(create);
  static Notification _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get subscriptionId => $_getIZ(0);
  @$pb.TagNumber(1)
  set subscriptionId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSubscriptionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSubscriptionId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get data => $_getSZ(1);
  @$pb.TagNumber(2)
  set data($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasData() => $_has(1);
  @$pb.TagNumber(2)
  void clearData() => clearField(2);
}

class NotificationError extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('NotificationError', createEmptyInstance: create)
    ..a<$core.int>(1, 'subscriptionId', $pb.PbFieldType.O3, protoName: 'subscriptionId')
    ..a<$core.int>(2, 'statusCode', $pb.PbFieldType.O3, protoName: 'statusCode')
    ..aOS(3, 'error')
    ..hasRequiredFields = false
  ;

  NotificationError._() : super();
  factory NotificationError() => create();
  factory NotificationError.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NotificationError.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  NotificationError clone() => NotificationError()..mergeFromMessage(this);
  NotificationError copyWith(void Function(NotificationError) updates) => super.copyWith((message) => updates(message as NotificationError));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NotificationError create() => NotificationError._();
  NotificationError createEmptyInstance() => create();
  static $pb.PbList<NotificationError> createRepeated() => $pb.PbList<NotificationError>();
  @$core.pragma('dart2js:noInline')
  static NotificationError getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NotificationError>(create);
  static NotificationError _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get subscriptionId => $_getIZ(0);
  @$pb.TagNumber(1)
  set subscriptionId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSubscriptionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSubscriptionId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get statusCode => $_getIZ(1);
  @$pb.TagNumber(2)
  set statusCode($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasStatusCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatusCode() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get error => $_getSZ(2);
  @$pb.TagNumber(3)
  set error($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasError() => $_has(2);
  @$pb.TagNumber(3)
  void clearError() => clearField(3);
}

