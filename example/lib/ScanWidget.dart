import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:mdsflutter_example/Device.dart';
import 'package:mdsflutter_example/DeviceConnectionStatus.dart';
import 'package:mdsflutter_example/DeviceInteractionWidget.dart';
import 'package:mdsflutter_example/AppModel.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class ScanWidget extends StatefulWidget {
  @override
  _ScanWidgetState createState() => _ScanWidgetState();
}

class _ScanWidgetState extends State<ScanWidget> {

  AppModel model;

  @override
  void initState() {
    super.initState();
    initPlatformState();
    model = Provider.of<AppModel>(context, listen: false);
    model.onDeviceMdsConnected((device) => {
      Navigator.push(context, MaterialPageRoute(builder: (context) =>
          DeviceInteractionWidget(device)
      ))
    });
  }

  Future<void> initPlatformState() async {
    if (!mounted) return;

    if (defaultTargetPlatform == TargetPlatform.android) {
      Permission.locationWhenInUse.isUndetermined.then((value) =>
          Permission.locationWhenInUse.request()
      );

      Permission.locationWhenInUse.isDenied.then((value) =>
          Permission.locationWhenInUse.request()
      );
    }
  }

  Widget _buildDeviceItem(BuildContext context, int index) {
    return Card(
      child: ListTile(
        title: Text(model.deviceList[index].name),
        subtitle: Text(model.deviceList[index].address),
        trailing: Text(model.deviceList[index].connectionStatus.statusName),
        onTap: () => model.connectToDevice(model.deviceList[index]),
      ),
    );
  }

  Widget _buildDeviceList(List<Device> deviceList) {
    return new Expanded(child: new ListView.builder(
        itemCount: model.deviceList.length,
        itemBuilder: (BuildContext context, int index) => _buildDeviceItem(context, index)
    )
    );
  }

  void onScanButtonPressed() {
    if (model.isScanning) {
      model.stopScan();
    } else {
      model.startScan();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Mds Flutter Example'),
        ),
        body: Consumer<AppModel>(
          builder: (context, model, child) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                RaisedButton(
                  onPressed: onScanButtonPressed,
                  child: Text(model.scanButtonText),
                ),
                _buildDeviceList(model.deviceList)
              ],
            );
          },
        )
    );
  }
}
