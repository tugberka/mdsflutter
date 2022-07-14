///
//  Generated code. Do not modify.
//  source: mdsflutter.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use requestResultDescriptor instead')
const RequestResult$json = const {
  '1': 'RequestResult',
  '2': const [
    const {'1': 'requestId', '3': 1, '4': 1, '5': 5, '10': 'requestId'},
    const {'1': 'statusCode', '3': 2, '4': 1, '5': 5, '10': 'statusCode'},
    const {'1': 'data', '3': 3, '4': 1, '5': 9, '10': 'data'},
  ],
};

/// Descriptor for `RequestResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List requestResultDescriptor = $convert.base64Decode('Cg1SZXF1ZXN0UmVzdWx0EhwKCXJlcXVlc3RJZBgBIAEoBVIJcmVxdWVzdElkEh4KCnN0YXR1c0NvZGUYAiABKAVSCnN0YXR1c0NvZGUSEgoEZGF0YRgDIAEoCVIEZGF0YQ==');
@$core.Deprecated('Use requestErrorDescriptor instead')
const RequestError$json = const {
  '1': 'RequestError',
  '2': const [
    const {'1': 'requestId', '3': 1, '4': 1, '5': 5, '10': 'requestId'},
    const {'1': 'statusCode', '3': 2, '4': 1, '5': 5, '10': 'statusCode'},
    const {'1': 'error', '3': 3, '4': 1, '5': 9, '10': 'error'},
  ],
};

/// Descriptor for `RequestError`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List requestErrorDescriptor = $convert.base64Decode('CgxSZXF1ZXN0RXJyb3ISHAoJcmVxdWVzdElkGAEgASgFUglyZXF1ZXN0SWQSHgoKc3RhdHVzQ29kZRgCIAEoBVIKc3RhdHVzQ29kZRIUCgVlcnJvchgDIAEoCVIFZXJyb3I=');
@$core.Deprecated('Use notificationDescriptor instead')
const Notification$json = const {
  '1': 'Notification',
  '2': const [
    const {'1': 'subscriptionId', '3': 1, '4': 1, '5': 5, '10': 'subscriptionId'},
    const {'1': 'data', '3': 2, '4': 1, '5': 9, '10': 'data'},
  ],
};

/// Descriptor for `Notification`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List notificationDescriptor = $convert.base64Decode('CgxOb3RpZmljYXRpb24SJgoOc3Vic2NyaXB0aW9uSWQYASABKAVSDnN1YnNjcmlwdGlvbklkEhIKBGRhdGEYAiABKAlSBGRhdGE=');
@$core.Deprecated('Use notificationErrorDescriptor instead')
const NotificationError$json = const {
  '1': 'NotificationError',
  '2': const [
    const {'1': 'subscriptionId', '3': 1, '4': 1, '5': 5, '10': 'subscriptionId'},
    const {'1': 'statusCode', '3': 2, '4': 1, '5': 5, '10': 'statusCode'},
    const {'1': 'error', '3': 3, '4': 1, '5': 9, '10': 'error'},
  ],
};

/// Descriptor for `NotificationError`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List notificationErrorDescriptor = $convert.base64Decode('ChFOb3RpZmljYXRpb25FcnJvchImCg5zdWJzY3JpcHRpb25JZBgBIAEoBVIOc3Vic2NyaXB0aW9uSWQSHgoKc3RhdHVzQ29kZRgCIAEoBVIKc3RhdHVzQ29kZRIUCgVlcnJvchgDIAEoCVIFZXJyb3I=');
