## 2.4.0

* Technical: Updated to latest Android SDK (36)
* Technical: Updated to protobuf 6.0.0

**Note**: Minimum iOS version is now 13

## 2.3.1

* Bugfix: unsubscribe would result in FlutterError [#42]

Thanks for the PR, @tim-alenus!

## 2.3.0

* Removing depricated PluginRegistry.Registrar [PR #35, #32]
* Merged other PRs [#33, #34]
* Updated to build with flutter 3.29 and Android SDK 35

Thanks for the PRs @84rry, @Panosfunk & @ksmets!

## 2.2.0

* Feature: onBleConnected callback

## 2.1.2
 
* Bugfix: namespace not defined by 84rrry (PR #27)
* Bugfix: Broken example
* migrated from deprecated gradle syntax
* ios version to 12

## 2.1.1
 
* Bugfix: Cocoapods can't access remote repository (Issue #13)
* Bugfix: The MdsAsync API is not documented (Issue #14)

## 2.1.0

* Prevent duplicate connections to same device
* Add error information to callback (Issue #20)
* Bugfix: MDS Not Cleared on app kill

## 2.0.0

* Fixed "MdsAsync.get returns null" (Issue #6)
* Changed protobuf-lite to -javalite (Issue #4)
* Tested with latest flutter and MDS (3.15.0)
* Updated to more modern gradle
* changed minimum ios version to 12
* Feature: Async API (See: MdsAsync)  Please send feedback and improvement ideas!

## 1.1.0

* Feature: Null safety

## 1.0.1

* Bugfix: Reconnect doesn't work if disconnect caused by BLE connection loss

## 1.0.0

* Initial release of the plugin.
