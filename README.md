# mdsflutter

Flutter plugin for MDS (Movesense Device Service) that is used for communicating with Movesense devices.

**NEW**: Async API is now considered production



### Additional steps for using the plugin

#### iOS

1. Intall Movesense iOS library using CocoaPods with adding this line to your app's Podfile:
  ```
  pod 'Movesense', :git => 'ssh://git@altssh.bitbucket.org:443/movesense/movesense-mobile-lib.git'
  ```

2. Set up your ios/Podfile as follows:
```
target 'Runner' do
  use_modular_headers!
  use_frameworks! :linkage => :static

  pod 'Movesense', :git => 'https://bitbucket.org/movesense/movesense-mobile-lib.git'

  flutter_install_all_ios_pods File.dirname(File.realpath(__FILE__))
end
```
so that MDS library is linked correctly. If you need to use frameworks that demand dynamic linking, [follow the instructions here](https://bitbucket.org/movesense/movesense-mobile-lib/issues/119/cannot-use-health-and-mdsflutter-depending).

#### Android

1. Download 'mdslib-x.x.x-release.aar' from movesense-mobile-lib repository and put it somewhere under 'android' folder of your app. Preferably create a new folder named 'android/libs' and put it there.

2. In 'build.gradle' of your android project, add the following lines (assuming .aar file is in android/libs):
```
allprojects {
    repositories {
        ...
        flatDir{
            dirs "$rootDir/libs"
        }
    }
}
```

## Usage (sync API)

```dart
import 'package:mdsflutter/Mds.dart';

// Scan for new devices
Mds.startScan((name, address) {
    // Handle new scanned device
});

// Stop scanning
Mds.stopScan();

// Connect to a Movesense device
Mds.connect(address,
            (serial) { /* onConnected */ },
            () { /* onDisconnected */ },
            (error) { /* onConnectionError */ }
    );

// Disconnect from a device
Mds.disconnect(address);

// Make a GET, PUT, POST, DEL request
Mds.get(Mds.createRequestUri(serial, resourceUri),
      contract,
      (data, statusCode) { /* onSuccess */ },
      (error, statusCode) { /* onError */ }
    );

// Make a subscription request
int subscriptionId = Mds.subscribe(Mds.createSubscriptionUri(serial, resourceUri),
      contract,
      (data, statusCode) { /* onSuccess */ },
      (error, statusCode) { /* onError */ },
      (data) { /* onNotification */ },
      (error, statusCode) { /* onSubscriptionError */ }
    );

// Unsubscribe from a subscription
Mds.unsubscribe(subscriptionId);
```
For more information and detailed documentation, check Mds.dart file. Example
application further demonstrates the usage off the plugin.

## Usage (async API)

`MdsAsync` provides the same scanning methods as `Mds`, and asynchronous
`get`, `put`, `post`, `del`, and `subscribe` methods. Use `Mds.connect` and
`Mds.disconnect` to manage device connections.

```dart
import 'dart:convert';

import 'package:mdsflutter/Mds.dart';

// Scan for devices, then connect using Mds.connect as shown above.
MdsAsync.startScan((name, address) {
  // Handle new scanned device.
});
// Call MdsAsync.stopScan() when scanning should end.

Future<void> readTemperature(String serial) async {
  try {
    final result = await MdsAsync.get(
      Mds.createRequestUri(serial, "/Meas/Temp"),
      "{}",
    );
    print(result);
  } on MdsError catch (error) {
    print("Request failed (${error.status}): ${error.error}");
  }
}

Future<void> switchLed(String serial, bool isOn) async {
  await MdsAsync.put(
    Mds.createRequestUri(serial, "/Component/Led"),
    jsonEncode({"isOn": isOn}),
  );
}

void subscribeToAccelerometer(String serial) {
  // Cancelling the stream subscription unsubscribes.
  final subscription = MdsAsync.subscribe(
    Mds.createSubscriptionUri(serial, "/Meas/Acc/104"),
    "{}",
  ).listen(
    (data) {
      // Handle notification data.
    },
    onError: (Object error) {
      // Subscription errors are reported as MdsError.
    },
  );
  // Call subscription.cancel() when notifications are no longer needed.
}
```

The request methods return `Future<dynamic>` with decoded response data.
`subscribe` returns a `Stream<dynamic>` of decoded notifications. Request and
subscription errors are reported as `MdsError`, which contains the HTTP status
and error message.
