package com.tugberka.mdsflutter

import android.bluetooth.BluetoothAdapter
import android.bluetooth.BluetoothManager
import android.bluetooth.le.ScanCallback
import android.bluetooth.le.ScanFilter
import android.bluetooth.le.ScanResult
import android.bluetooth.le.ScanSettings
import android.content.Context
import android.os.ParcelUuid
import com.movesense.mds.*

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar
import java.util.*

/** MdsflutterPlugin */
class MdsflutterPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  private lateinit var mds: Mds
  private val subscriptionMap = mutableMapOf<Int, MdsSubscription>()
  private lateinit var bluetoothAdapter: BluetoothAdapter
  private val scanCb = object : ScanCallback() {
    override fun onScanResult(callbackType: Int, result: ScanResult) {
      with(result.device) {
        val map = hashMapOf(
                "address" to address,
                "name" to name
        )
        channel.invokeMethod("onNewScannedDevice", map)
      }
    }

    override fun onScanFailed(errorCode: Int) {
      channel.invokeMethod("onScanFailed", null)
    }
  }

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.getFlutterEngine().getDartExecutor(), "mdsflutter")
    channel.setMethodCallHandler(this)
    mds = Mds.Builder().build(flutterPluginBinding.applicationContext)
    val manager = flutterPluginBinding.applicationContext.getSystemService(Context.BLUETOOTH_SERVICE) as BluetoothManager
    bluetoothAdapter = manager.adapter
  }

  // This static function is optional and equivalent to onAttachedToEngine. It supports the old
  // pre-Flutter-1.12 Android projects. You are encouraged to continue supporting
  // plugin registration via this function while apps migrate to use the new Android APIs
  // post-flutter-1.12 via https://flutter.dev/go/android-project-migration.
  //
  // It is encouraged to share logic between onAttachedToEngine and registerWith to keep
  // them functionally equivalent. Only one of onAttachedToEngine or registerWith will be called
  // depending on the user's project. onAttachedToEngine or registerWith must both be defined
  // in the same class.
  companion object {
    @JvmStatic
    fun registerWith(registrar: Registrar) {
      val channel = MethodChannel(registrar.messenger(), "mdsflutter")
      channel.setMethodCallHandler(MdsflutterPlugin())
    }
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    when (call.method) {
      "connect" -> {
        call.argument<String>("address")?.let {
          connect(it)
          result.success(null)
        } ?: result.notImplemented()
      }
      "disconnect" -> {
        call.argument<String>("address")?.let {
          disconnect(it)
          result.success(null)
        } ?: result.notImplemented()
      }
      "get" -> {
        val uri = call.argument<String>("uri")
        val contract = call.argument<String>("contract")
        val requestId = call.argument<Int>("requestId")
        if (uri != null && contract != null && requestId != null) {
          get(uri, contract, requestId)
          result.success(null)
        } else {
          result.notImplemented()
        }
      }
      "put" -> {
        val uri = call.argument<String>("uri")
        val contract = call.argument<String>("contract")
        val requestId = call.argument<Int>("requestId")
        if (uri != null && contract != null && requestId != null) {
          put(uri, contract, requestId)
          result.success(null)
        } else {
          result.notImplemented()
        }
      }
      "post" -> {
        val uri = call.argument<String>("uri")
        val contract = call.argument<String>("contract")
        val requestId = call.argument<Int>("requestId")
        if (uri != null && contract != null && requestId != null) {
          post(uri, contract, requestId)
          result.success(null)
        } else {
          result.notImplemented()
        }
      }
      "del" -> {
        val uri = call.argument<String>("uri")
        val contract = call.argument<String>("contract")
        val requestId = call.argument<Int>("requestId")
        if (uri != null && contract != null && requestId != null) {
          del(uri, contract, requestId)
          result.success(null)
        } else {
          result.notImplemented()
        }
      }
      "subscribe" -> {
        val uri = call.argument<String>("uri")
        val contract = call.argument<String>("contract")
        val requestId = call.argument<Int>("requestId")
        val subscriptionId = call.argument<Int>("subscriptionId")
        if (uri != null && contract != null && subscriptionId != null && requestId != null) {
          subscribe(uri, contract, requestId, subscriptionId)
          result.success(null)
        } else {
          result.notImplemented()
        }
      }
      "unsubscribe" -> {
        call.argument<Int>("subscriptionId")?.let {
          unsubscribe(it)
          result.success(null)
        } ?: result.notImplemented()
      }
      "startScan" -> {
        startScan()
        result.success(null)
      }
      "stopScan" -> {
        stopScan()
        result.success(null)
      }
      else -> result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  private fun startScan() {
    val scanFilter1 = ScanFilter.Builder().setServiceUuid(ParcelUuid(UUID.fromString("61353090-8231-49cc-b57a-886370740041"))).build()
    val scanFilter2 = ScanFilter.Builder().setServiceUuid(ParcelUuid(UUID.fromString("0000FDF3-0000-1000-8000-00805F9B34FB"))).build()
    val settings = ScanSettings.Builder().build()
    bluetoothAdapter.bluetoothLeScanner.startScan(listOf(scanFilter1, scanFilter2), settings, scanCb)
  }

  private fun stopScan() {
    bluetoothAdapter.bluetoothLeScanner.stopScan(scanCb)
  }


  private fun connect(address: String) {
    mds.connect(address, object: MdsConnectionListener {
      override fun onConnect(address: String) {
      }

      override fun onConnectionComplete(address: String, serial: String) {
        val map = hashMapOf(
                "address" to address,
                "serial" to serial
        )
        channel.invokeMethod("onConnect", map)
      }

      override fun onDisconnect(address: String) {
        channel.invokeMethod("onDisconnect", address)
      }

      override fun onError(exception: MdsException) {
        channel.invokeMethod("onConnectionError", exception.statusCode)
      }
    })
  }

  private fun disconnect(address: String) {
    mds.disconnect(address)
  }

  private fun get(uri: String, contract: String, requestId: Int) {
    val handler = object : MdsResponseListener {
      override fun onError(exception: MdsException) {
        val result = Protos.RequestError.newBuilder().apply {
          this.requestId = requestId
          statusCode = exception.statusCode ?: 0
          this.error = exception.message ?: ""
        }.build()
        channel.invokeMethod("onRequestError", result.toByteArray())
      }

      override fun onSuccess(data: String, header: MdsHeader) {
        val result = Protos.RequestResult.newBuilder().apply {
          this.requestId = requestId
          statusCode = header.status
          this.data = data
        }.build()
        channel.invokeMethod("onRequestResult", result.toByteArray())
      }
    }
    mds.get(uri, contract, handler)
  }

  private fun put(uri: String, contract: String, requestId: Int) {
    val handler = object : MdsResponseListener {
      override fun onError(exception: MdsException) {
        val result = Protos.RequestError.newBuilder().apply {
          this.requestId = requestId
          statusCode = exception.statusCode ?: 0
          this.error = exception.message ?: ""
        }.build()
        channel.invokeMethod("onRequestError",result.toByteArray())
      }

      override fun onSuccess(data: String, header: MdsHeader) {
        val result = Protos.RequestResult.newBuilder().apply {
          this.requestId = requestId
          statusCode = header.status
          this.data = data
        }.build()
        channel.invokeMethod("onRequestResult", result.toByteArray())
      }
    }
    mds.put(uri, contract, handler)
  }

  private fun post(uri: String, contract: String, requestId: Int) {
    val handler = object : MdsResponseListener {
      override fun onError(exception: MdsException) {
        val result = Protos.RequestError.newBuilder().apply {
          this.requestId = requestId
          statusCode = exception.statusCode ?: 0
          this.error = exception.message ?: ""
        }.build()
        channel.invokeMethod("onRequestError", result.toByteArray())
      }

      override fun onSuccess(data: String, header: MdsHeader) {
        val result = Protos.RequestResult.newBuilder().apply {
          this.requestId = requestId
          statusCode = header.status
          this.data = data
        }.build()
        channel.invokeMethod("onRequestResult", result.toByteArray())
      }
    }
    mds.post(uri, contract, handler)
  }

  private fun del(uri: String, contract: String, requestId: Int) {
    val handler = object : MdsResponseListener {
      override fun onError(exception: MdsException) {
        val result = Protos.RequestError.newBuilder().apply {
          this.requestId = requestId
          statusCode = exception.statusCode ?: 0
          this.error = exception.message ?: ""
        }.build()
        channel.invokeMethod("onRequestError",result.toByteArray())
      }

      override fun onSuccess(data: String, header: MdsHeader) {
        val result = Protos.RequestResult.newBuilder().apply {
          this.requestId = requestId
          statusCode = header.status
          this.data = data
        }.build()
        channel.invokeMethod("onRequestResult",result.toByteArray())
      }
    }
    mds.delete(uri, contract, handler)
  }

  private fun subscribe(uri: String, contract: String, requestId: Int, subscriptionId: Int) {
    val responseListener = object : MdsResponseListener {
      override fun onError(exception: MdsException) {
        val result = Protos.RequestError.newBuilder().apply {
          this.requestId = requestId
          statusCode = exception.statusCode ?: 0
          this.error = exception.message ?: ""
        }.build()
        channel.invokeMethod("onRequestError",result.toByteArray())
        subscriptionMap.remove(subscriptionId)
      }

      override fun onSuccess(data: String, header: MdsHeader) {
        val result = Protos.RequestResult.newBuilder().apply {
          this.requestId = requestId
          statusCode = header.status
          this.data = data
        }.build()
        channel.invokeMethod("onRequestResult",result.toByteArray())
      }
    }

    val notificationListener = object : MdsNotificationListener {
      override fun onNotification(data: String) {
        val result = Protos.Notification.newBuilder().apply {
          this.subscriptionId = subscriptionId
          this.data = data
        }.build()
        channel.invokeMethod("onNotification", result.toByteArray())
      }

      override fun onError(exception: MdsException) {
        val result = Protos.NotificationError.newBuilder().apply {
          this.subscriptionId = subscriptionId
          statusCode = exception.statusCode ?: 0
          this.error = exception.message ?: ""
        }.build()
        channel.invokeMethod("onNotificationError", result.toByteArray())
      }
    }

    val subscription = mds.subscribe(uri, contract, notificationListener, responseListener)
    subscriptionMap[subscriptionId] = subscription
  }

  private fun unsubscribe(subscriptionId: Int) {
    subscriptionMap.remove(subscriptionId)?.unsubscribe()
  }
}
