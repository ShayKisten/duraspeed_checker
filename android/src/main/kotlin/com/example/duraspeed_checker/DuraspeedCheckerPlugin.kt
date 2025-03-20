package com.example.duraspeed_checker

import androidx.annotation.NonNull
import android.app.ActivityManager
import android.content.pm.PackageManager
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** DuraspeedCheckerPlugin */
class DuraspeedCheckerPlugin : FlutterPlugin, MethodCallHandler {
  private lateinit var channel: MethodChannel
  private lateinit var packageManager: PackageManager
  private lateinit var activityManager: ActivityManager

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "duraspeed_checker")
    channel.setMethodCallHandler(this)
    packageManager = flutterPluginBinding.applicationContext.packageManager
    activityManager = flutterPluginBinding.applicationContext.getSystemService(android.content.Context.ACTIVITY_SERVICE) as ActivityManager
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    when (call.method) {
      "getPlatformVersion" -> {
        result.success("Android ${android.os.Build.VERSION.RELEASE}")
      }
      "checkDuraSpeed" -> {
        val hasDuraSpeed = checkDuraSpeedExists()
        result.success(hasDuraSpeed)
      }
      "isDuraSpeedEnabled" -> {
        val isEnabled = isDuraSpeedActive()
        result.success(isEnabled)
      }
      else -> {
        result.notImplemented()
      }
    }
  }

  private fun checkDuraSpeedExists(): Boolean {
    val packages = packageManager.getInstalledPackages(0)
    return packages.any { pkgInfo ->
      pkgInfo.packageName.lowercase().contains("duraspeed")
    }
  }

  private fun isDuraSpeedActive(): Boolean {
    // Find a DuraSpeed package
    val duraspeedPackage = packageManager.getInstalledPackages(0)
      .find { pkgInfo -> pkgInfo.packageName.lowercase().contains("duraspeed") }
      ?.packageName

    if (duraspeedPackage == null) {
      return false // No DuraSpeed package found, assume not active
    }

    // Check if any service from this package is running
    val runningServices = activityManager.getRunningServices(Integer.MAX_VALUE)
    return runningServices.any { serviceInfo ->
      serviceInfo.service.packageName == duraspeedPackage && serviceInfo.foreground
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}