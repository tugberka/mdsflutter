import 'dart:collection';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:mdsflutter_example/Device.dart';
import 'package:mdsflutter/Mds.dart';
import 'package:mdsflutter_example/DeviceConnectionStatus.dart';

import 'dart:developer' as developer;

class AppModel extends ChangeNotifier {
  final Set<Device?> _deviceList = Set();
  bool _isScanning = false;
  void Function(Device)? _onDeviceMdsConnectedCb;
  void Function(Device)? _onDeviceDisonnectedCb;

  UnmodifiableListView<Device?> get deviceList =>
      UnmodifiableListView(_deviceList);

  bool get isScanning => _isScanning;

  String get scanButtonText => _isScanning ? "Stop scan" : "Start scan";

  void onDeviceMdsConnected(void Function(Device) cb) {
    _onDeviceMdsConnectedCb = cb;
  }

  void onDeviceMdsDisconnected(void Function(Device) cb) {
    _onDeviceDisonnectedCb = cb;
  }

  void startScan() {
    _deviceList.forEach((device) {
      if (device != null &&
          device.connectionStatus == DeviceConnectionStatus.CONNECTED) {
        disconnectFromDevice(device);
      }
    });

    _deviceList.clear();
    notifyListeners();

    try {
      Mds.startScan((name, address) {
        Device device = Device(name ?? "", address ?? "");
        if (!_deviceList.contains(device)) {
          _deviceList.add(device);
          notifyListeners();
        }
      });
      _isScanning = true;
      notifyListeners();
    } on PlatformException {
      _isScanning = false;
      notifyListeners();
    }
  }

  void stopScan() {
    Mds.stopScan();
    _isScanning = false;
    notifyListeners();
  }

  void connectToDevice(Device device) {
    device.onConnecting();
    final address = device.address;
    if (address == null) return;
    Mds.connect(
        address,
        (serial) => _onDeviceMdsConnected(address, serial),
        () => _onDeviceDisconnected(address),
        () => _onDeviceConnectError(address));
  }

  void disconnectFromDevice(Device device) {
    final address = device.address;
    if (address == null) return;
    Mds.disconnect(address);
    _onDeviceDisconnected(address);
  }

  void _onDeviceMdsConnected(String address, String serial) {
    Device? foundDevice =
        _deviceList.firstWhere((element) => element?.address == address);
    if (foundDevice != null) {
      foundDevice.onMdsConnected(serial);
      notifyListeners();
      if (_onDeviceMdsConnectedCb != null) {
        _onDeviceMdsConnectedCb?.call(foundDevice);
      }
    }
  }

  void _onDeviceDisconnected(String address) {
    Device? foundDevice =
        _deviceList.firstWhere((element) => element?.address == address);
    if (foundDevice != null) {
      foundDevice.onDisconnected();
      notifyListeners();
      if (_onDeviceDisonnectedCb != null) {
        _onDeviceDisonnectedCb?.call(foundDevice);
      }
    }
  }

  void _onDeviceConnectError(String address) {
    _onDeviceDisconnected(address);
  }
}
