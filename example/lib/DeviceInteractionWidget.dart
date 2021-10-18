import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mdsflutter_example/DeviceModel.dart';
import 'package:provider/provider.dart';

import 'package:mdsflutter_example/Device.dart';

import 'AppModel.dart';

class DeviceInteractionWidget extends StatefulWidget {
  final Device device;
  const DeviceInteractionWidget(this.device);

  @override
  State<StatefulWidget> createState() {
    return _DeviceInteractionWidgetState();
  }
}

class _DeviceInteractionWidgetState extends State<DeviceInteractionWidget> {
  AppModel? _appModel;

  @override
  void initState() {
    super.initState();
    _appModel = Provider.of<AppModel>(context, listen: false);
    _appModel?.onDeviceMdsDisconnected((device) => {Navigator.pop(context)});
  }

  void _onAccelerometerButtonPressed(DeviceModel deviceModel) {
    if (deviceModel.accelerometerSubscribed) {
      deviceModel.unsubscribeFromAccelerometer();
    } else {
      deviceModel.subscribeToAccelerometer();
    }
  }

  void _onHrButtonPressed(DeviceModel deviceModel) {
    if (deviceModel.hrSubscribed) {
      deviceModel.unsubscribeFromHr();
    } else {
      deviceModel.subscribeToHr();
    }
  }

  @override
  void dispose() {
    _appModel?.disconnectFromDevice(widget.device);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Device device = widget.device;
    return ChangeNotifierProvider(
      create: (context) => DeviceModel(device.name ?? "", device.serial ?? ""),
      child: Consumer<DeviceModel>(
        builder: (context, model, child) {
          return Scaffold(
              appBar: AppBar(
                title: Text(device.name ?? ""),
              ),
              body: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  _accelerometerItem(model),
                  _hrItem(model),
                  _ledItem(model),
                  _temperatureItem(model)
                ],
              ));
        },
      ),
    );
  }

  Widget _accelerometerItem(DeviceModel deviceModel) {
    return Card(
      child: ListTile(
        title: Text("Accelerometer"),
        subtitle: Text(deviceModel.accelerometerData),
        trailing: ElevatedButton(
          child: Text(deviceModel.accelerometerSubscribed
              ? "Unsubscribe"
              : "Subscribe"),
          onPressed: () => _onAccelerometerButtonPressed(deviceModel),
        ),
      ),
    );
  }

  Widget _hrItem(DeviceModel deviceModel) {
    return Card(
      child: ListTile(
        title: Text("Heart rate"),
        subtitle: Text(deviceModel.hrData),
        trailing: ElevatedButton(
          child: Text(deviceModel.hrSubscribed ? "Unsubscribe" : "Subscribe"),
          onPressed: () => _onHrButtonPressed(deviceModel),
        ),
      ),
    );
  }

  Widget _ledItem(DeviceModel deviceModel) {
    return Card(
      child: ListTile(
        title: Text("Led"),
        trailing: Switch(
          value: deviceModel.ledStatus,
          onChanged: (b) => {deviceModel.switchLed()},
        ),
      ),
    );
  }

  Widget _temperatureItem(DeviceModel deviceModel) {
    return Card(
      child: ListTile(
        title: Text("Temperature"),
        subtitle: Text(deviceModel.temperature),
        trailing: ElevatedButton(
          child: Text("Get"),
          onPressed: () => deviceModel.getTemperature(),
        ),
      ),
    );
  }
}
