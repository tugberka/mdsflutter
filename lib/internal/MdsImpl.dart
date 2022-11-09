import 'dart:async';
import 'dart:convert';
import 'dart:developer' as developer;
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:mdsflutter/gen/protos/mdsflutter.pb.dart';

class MdsImpl {
  MethodChannel _channel = const MethodChannel('mdsflutter');

  int _idCounter = 0;
  int _subscriptionCounter = 0;
  Map _connectCbMap = Map<String, void Function(String)>();
  Map _connectErrorCbMap = Map<String, void Function()>();
  Map _disconnectCbMap = Map<String, void Function()>();
  List<String> _disconnectedDevices = [];
  Map _requestResultCbMap = Map<int, void Function(String, int)>();
  Map _requestErrorCbMap = Map<int, void Function(String, int)>();
  Map _notifyCbMap = Map<int, void Function(String)>();
  Map _subscriptionErrorCbMap = Map<int, void Function(String, int)>();
  Map _serialToAddressMap = Map<String?, String?>();
  void Function(String?, String?)? _newScannedDeviceCb;

  void startScan(void Function(String?, String?) onNewDeviceFound) {
    _newScannedDeviceCb = onNewDeviceFound;
    _channel.invokeMethod('startScan', null);
  }

  void stopScan() {
    _newScannedDeviceCb = null;
    _channel.invokeMethod('stopScan', null);
  }

  void connect(String address, void Function(String) onConnected,
      void Function() onDisconnected, void Function() onConnectionError) {
    _connectCbMap[address] = onConnected;
    _disconnectCbMap[address] = onDisconnected;
    _connectErrorCbMap[address] = onConnectionError;
    _channel.invokeMethod('connect', {"address": address});
  }

  void disconnect(String address) {
    _disconnectedDevices.add(address);
    _channel.invokeMethod('disconnect', {"address": address});
  }

  void get(String uri, String contract, void Function(String, int) onSuccess,
      void Function(String, int) onError) {
    _idCounter++;
    _requestResultCbMap[_idCounter] = onSuccess;
    _requestErrorCbMap[_idCounter] = onError;

    _channel.invokeMethod('get', <String, dynamic>{
      "uri": uri,
      "contract": contract,
      "requestId": _idCounter
    });
  }

  void put(String uri, String contract, void Function(String, int) onSuccess,
      void Function(String, int) onError) {
    _idCounter++;
    _requestResultCbMap[_idCounter] = onSuccess;
    _requestErrorCbMap[_idCounter] = onError;
    _channel.invokeMethod('put', <String, dynamic>{
      "uri": uri,
      "contract": contract,
      "requestId": _idCounter
    });
  }

  void post(String uri, String contract, void Function(String, int) onSuccess,
      void Function(String, int) onError) {
    _idCounter++;
    _requestResultCbMap[_idCounter] = onSuccess;
    _requestErrorCbMap[_idCounter] = onError;
    _channel.invokeMethod('post', <String, dynamic>{
      "uri": uri,
      "contract": contract,
      "requestId": _idCounter
    });
  }

  void del(String uri, String contract, void Function(String, int) onSuccess,
      void Function(String, int) onError) {
    _idCounter++;
    _requestResultCbMap[_idCounter] = onSuccess;
    _requestErrorCbMap[_idCounter] = onError;
    _channel.invokeMethod('del', <String, dynamic>{
      "uri": uri,
      "contract": contract,
      "requestId": _idCounter
    });
  }

  int subscribe(
      String uri,
      String contract,
      void Function(String, int) onSuccess,
      void Function(String, int) onError,
      void Function(String) onNotification,
      void Function(String, int) onSubscriptionError) {
    _idCounter++;
    _subscriptionCounter++;
    _requestResultCbMap[_idCounter] = onSuccess;
    _requestErrorCbMap[_idCounter] = onError;
    _notifyCbMap[_subscriptionCounter] = onNotification;
    _subscriptionErrorCbMap[_subscriptionCounter] = onSubscriptionError;

    String mdsUri = uri;
    String mdsContract = contract;

    if (defaultTargetPlatform == TargetPlatform.android) {
      mdsUri = "suunto://MDS/EventListener";
      Map<String, dynamic> contractMap = jsonDecode(mdsContract);
      contractMap["Uri"] = uri;
      mdsContract = json.encode(contractMap);
    }

    _channel.invokeMethod('subscribe', <String, dynamic>{
      "uri": mdsUri,
      "contract": mdsContract,
      "requestId": _idCounter,
      "subscriptionId": _subscriptionCounter
    });
    return _subscriptionCounter;
  }

  void unsubscribe(int subscriptionId) {
    if (_notifyCbMap.containsKey(subscriptionId)) {
      _channel.invokeMethod('unsubscribe', {"subscriptionId": subscriptionId});
      _notifyCbMap.remove(subscriptionId);
      _subscriptionErrorCbMap.remove(subscriptionId);
    }
  }

  MdsImpl._init() {
    developer.log("Initializing MDS Flutter");
    _channel.setMethodCallHandler(_onNativeMethodCall);
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      _doConnectSubscription();
    }
  }

  static final MdsImpl _instance = MdsImpl._init();

  factory MdsImpl() {
    return _instance;
  }

  void _doConnectSubscription() {
    subscribe("MDS/ConnectedDevices", "{}", (d, c) => {}, (e, c) => {}, (data) {
      final decoded = jsonDecode(data);
      final method = decoded["Method"];
      if (method == "POST") {
        if (decoded.containsKey("Body")) {
          final body = decoded["Body"];
          final deviceInfo = body["DeviceInfo"];
          final connection = body["Connection"];
          final uuid = connection["UUID"] as String?;
          final serial = deviceInfo["serial"] as String?;
          _serialToAddressMap[serial] = uuid;
          _onConnect(uuid, serial);
        }
      } else if (method == "DEL") {
        final body = decoded["Body"];
        final serial = body["Serial"] as String?;
        if (_serialToAddressMap.containsKey(serial)) {
          _onDisconnect(_serialToAddressMap[serial]);
        }
      }
    }, (e, c) => {});
  }

  Future<void> _onNativeMethodCall(MethodCall call) async {
    switch (call.method) {
      case "onNewScannedDevice":
        Map args = call.arguments;
        _onNewScannedDevice(args["name"], args["address"]);
        break;
      case "onConnect":
        Map args = call.arguments;
        _onConnect(args["address"], args["serial"]);
        break;
      case "onDisconnect":
        String? address = call.arguments;
        _onDisconnect(address);
        break;
      case "onConnectionError":
        String? address = call.arguments;
        _onConnectionError(address);
        break;
      case "onRequestResult":
        final Uint8List proto = call.arguments;
        final RequestResult requestResult = RequestResult.fromBuffer(proto);
        _onRequestResult(requestResult.requestId, requestResult.data,
            requestResult.statusCode);
        break;
      case "onRequestError":
        final Uint8List proto = call.arguments;
        final RequestError requestError = RequestError.fromBuffer(proto);
        _onRequestError(requestError.requestId, requestError.error,
            requestError.statusCode);
        break;
      case "onNotification":
        final Uint8List proto = call.arguments;
        final Notification notification = Notification.fromBuffer(proto);
        _onNotify(notification.subscriptionId, notification.data);
        break;
      case "onNotificationError":
        final Uint8List proto = call.arguments;
        final NotificationError error = NotificationError.fromBuffer(proto);
        _onSubscriptionError(
            error.subscriptionId, error.error, error.statusCode);
        break;
    }
  }

  void _onNewScannedDevice(String? name, String? address) {
    if (_newScannedDeviceCb != null) {
      _newScannedDeviceCb!(name, address);
    }
  }

  void _onConnect(String? address, String? serial) {
    if (_connectCbMap.containsKey(address)) {
      developer.log("New connected device with serial: " + serial!);
      void Function(String) cb = _connectCbMap[address];
      cb(serial);
    }
  }

  void _onDisconnect(String? address) {
    if (_disconnectCbMap.containsKey(address)) {
      developer.log("Device disconnected, address: " + address!);
      void Function() cb = _disconnectCbMap[address];
      cb();
      // Only remove from the map if the disconnect was initiated by user
      if (_disconnectedDevices.contains(address)) {
        _connectCbMap.remove(address);
        _disconnectCbMap.remove(address);
        _connectErrorCbMap.remove(address);
        _disconnectedDevices.remove(address);
      }
    }
  }

  void _onConnectionError(String? address) {
    if (_connectErrorCbMap.containsKey(address)) {
      developer.log("Device connection error, address: " + address!);
      void Function() cb = _connectErrorCbMap[address];
      cb();
      _connectCbMap.remove(address);
      _disconnectCbMap.remove(address);
      _connectErrorCbMap.remove(address);
    }
  }

  void _onRequestResult(int requestId, String data, int code) {
    if (_requestResultCbMap.containsKey(requestId)) {
      void Function(String, int) cb = _requestResultCbMap[requestId];
      cb(data, code);
      _requestResultCbMap.remove(requestId);
      _requestErrorCbMap.remove(requestId);
    }
  }

  void _onRequestError(int requestId, String error, int code) {
    if (_requestErrorCbMap.containsKey(requestId)) {
      void Function(String, int) cb = _requestErrorCbMap[requestId];
      cb(error, code);
      _requestResultCbMap.remove(requestId);
      _requestErrorCbMap.remove(requestId);
    }
  }

  void _onNotify(int subscriptionId, String data) {
    if (_notifyCbMap.containsKey(subscriptionId)) {
      void Function(String) cb = _notifyCbMap[subscriptionId];
      cb(data);
    }
  }

  void _onSubscriptionError(int subscriptionId, String error, int code) {
    if (_subscriptionErrorCbMap.containsKey(subscriptionId)) {
      void Function(String, int) cb = _subscriptionErrorCbMap[subscriptionId];
      cb(error, code);
      _subscriptionErrorCbMap.remove(subscriptionId);
      _subscriptionErrorCbMap.remove(subscriptionId);
    }
  }
}
