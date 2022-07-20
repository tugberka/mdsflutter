///
//  Generated code. Do not modify.
//  source: mdsflutter.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class RequestResult extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RequestResult', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'requestId', $pb.PbFieldType.O3, protoName: 'requestId')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'statusCode', $pb.PbFieldType.O3, protoName: 'statusCode')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'data')
    ..hasRequiredFields = false
  ;

  RequestResult._() : super();
  factory RequestResult({
    $core.int? requestId,
    $core.int? statusCode,
    $core.String? data,
  }) {
    final _result = create();
    if (requestId != null) {
      _result.requestId = requestId;
    }
    if (statusCode != null) {
      _result.statusCode = statusCode;
    }
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory RequestResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RequestResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RequestResult clone() => RequestResult()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RequestResult copyWith(void Function(RequestResult) updates) => super.copyWith((message) => updates(message as RequestResult)) as RequestResult; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RequestResult create() => RequestResult._();
  RequestResult createEmptyInstance() => create();
  static $pb.PbList<RequestResult> createRepeated() => $pb.PbList<RequestResult>();
  @$core.pragma('dart2js:noInline')
  static RequestResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RequestResult>(create);
  static RequestResult? _defaultInstance;

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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RequestError', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'requestId', $pb.PbFieldType.O3, protoName: 'requestId')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'statusCode', $pb.PbFieldType.O3, protoName: 'statusCode')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error')
    ..hasRequiredFields = false
  ;

  RequestError._() : super();
  factory RequestError({
    $core.int? requestId,
    $core.int? statusCode,
    $core.String? error,
  }) {
    final _result = create();
    if (requestId != null) {
      _result.requestId = requestId;
    }
    if (statusCode != null) {
      _result.statusCode = statusCode;
    }
    if (error != null) {
      _result.error = error;
    }
    return _result;
  }
  factory RequestError.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RequestError.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RequestError clone() => RequestError()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RequestError copyWith(void Function(RequestError) updates) => super.copyWith((message) => updates(message as RequestError)) as RequestError; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RequestError create() => RequestError._();
  RequestError createEmptyInstance() => create();
  static $pb.PbList<RequestError> createRepeated() => $pb.PbList<RequestError>();
  @$core.pragma('dart2js:noInline')
  static RequestError getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RequestError>(create);
  static RequestError? _defaultInstance;

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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Notification', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'subscriptionId', $pb.PbFieldType.O3, protoName: 'subscriptionId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'data')
    ..hasRequiredFields = false
  ;

  Notification._() : super();
  factory Notification({
    $core.int? subscriptionId,
    $core.String? data,
  }) {
    final _result = create();
    if (subscriptionId != null) {
      _result.subscriptionId = subscriptionId;
    }
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory Notification.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Notification.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Notification clone() => Notification()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Notification copyWith(void Function(Notification) updates) => super.copyWith((message) => updates(message as Notification)) as Notification; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Notification create() => Notification._();
  Notification createEmptyInstance() => create();
  static $pb.PbList<Notification> createRepeated() => $pb.PbList<Notification>();
  @$core.pragma('dart2js:noInline')
  static Notification getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Notification>(create);
  static Notification? _defaultInstance;

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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'NotificationError', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'subscriptionId', $pb.PbFieldType.O3, protoName: 'subscriptionId')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'statusCode', $pb.PbFieldType.O3, protoName: 'statusCode')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error')
    ..hasRequiredFields = false
  ;

  NotificationError._() : super();
  factory NotificationError({
    $core.int? subscriptionId,
    $core.int? statusCode,
    $core.String? error,
  }) {
    final _result = create();
    if (subscriptionId != null) {
      _result.subscriptionId = subscriptionId;
    }
    if (statusCode != null) {
      _result.statusCode = statusCode;
    }
    if (error != null) {
      _result.error = error;
    }
    return _result;
  }
  factory NotificationError.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NotificationError.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NotificationError clone() => NotificationError()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NotificationError copyWith(void Function(NotificationError) updates) => super.copyWith((message) => updates(message as NotificationError)) as NotificationError; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NotificationError create() => NotificationError._();
  NotificationError createEmptyInstance() => create();
  static $pb.PbList<NotificationError> createRepeated() => $pb.PbList<NotificationError>();
  @$core.pragma('dart2js:noInline')
  static NotificationError getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NotificationError>(create);
  static NotificationError? _defaultInstance;

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

