package com.example.cabo_customer

import android.Manifest
import android.content.pm.PackageManager
import android.os.Build
import androidx.core.content.ContextCompat
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
      companion object {
        const val notificationPermission = Manifest.permission.POST_NOTIFICATIONS
        const val notificationRequestCode = 101
        const val channel = "com.example.cabo_customer"
        const val notificationMethodPermission = "getNotificationPermission"
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, channel).setMethodCallHandler {
            call,_ ->
            if (call.method == notificationMethodPermission) {
                checkPermission()
            }
        }
    }

    private fun checkPermission() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
            val request = ContextCompat.checkSelfPermission(this, notificationPermission)
            if (request == PackageManager.PERMISSION_DENIED) {
                requestPermissions(arrayOf(notificationPermission),notificationRequestCode)
            }
            return
        }
    }
}
