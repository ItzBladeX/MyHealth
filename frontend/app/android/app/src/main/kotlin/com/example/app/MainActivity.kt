package com.example.app

import android.app.AppOpsManager
import android.app.usage.UsageEvents
import android.app.usage.UsageStatsManager
import android.content.Context
import android.content.Intent
import android.os.Process
import android.provider.Settings
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.util.Calendar

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.myhealth.app/stats"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "checkPermission" -> result.success(hasUsageStatsPermission())
                "grantPermission" -> {
                    startActivity(Intent(Settings.ACTION_USAGE_ACCESS_SETTINGS))
                    result.success(true)
                }
                "getUsageStats" -> result.success(fetchDailyUsageStats())
                else -> result.notImplemented()
            }
        }
    }

    private fun hasUsageStatsPermission(): Boolean {
        val appOps = getSystemService(Context.APP_OPS_SERVICE) as AppOpsManager
        val mode = appOps.noteOpNoThrow(
            AppOpsManager.OPSTR_GET_USAGE_STATS,
            Process.myUid(),
            packageName
        )
        return mode == AppOpsManager.MODE_ALLOWED
    }

    private fun fetchDailyUsageStats(): List<Map<String, Any>> {
        val statsList = mutableListOf<Map<String, Any>>()
        val usageStatsManager = getSystemService(Context.USAGE_STATS_SERVICE) as UsageStatsManager
        
        val calendar = Calendar.getInstance()
        calendar.set(Calendar.HOUR_OF_DAY, 0)
        calendar.set(Calendar.MINUTE, 0)
        calendar.set(Calendar.SECOND, 0)
        val startTime = calendar.timeInMillis
        val endTime = System.currentTimeMillis()

        // 1. Fetch individual application packages foreground tracking usage
        val usageStats = usageStatsManager.queryUsageStats(UsageStatsManager.INTERVAL_DAILY, startTime, endTime)
        if (usageStats != null) {
            for (stat in usageStats) {
                if (stat.totalTimeInForeground > 0) {
                    val minutes = stat.totalTimeInForeground.toDouble() / 1000.0 / 60.0
                    statsList.add(mapOf("package" to stat.packageName, "minutes" to minutes))
                }
            }
        }

        // 2. Query timeline events to calculate Screen On / Screen Off total duration metrics
        val events = usageStatsManager.queryEvents(startTime, endTime)
        var totalScreenOnMs = 0L
        var lastScreenOnTime = startTime // Default baseline starts counting from midnight if already awake

        val event = UsageEvents.Event()
        while (events.hasNextEvent()) {
            events.getNextEvent(event)
            when (event.eventType) {
                UsageEvents.Event.SCREEN_INTERACTIVE -> {
                    lastScreenOnTime = event.timeStamp
                }
                UsageEvents.Event.SCREEN_NON_INTERACTIVE -> {
                    if (lastScreenOnTime > startTime) {
                        totalScreenOnMs += (event.timeStamp - lastScreenOnTime)
                        // Reset target tracker marker so we don't double count open loops
                        lastScreenOnTime = 0L 
                    }
                }
            }
        }

        // If the device screen is currently on right now during query execution, add the pending duration
        if (lastScreenOnTime > 0L) {
            totalScreenOnMs += (endTime - lastScreenOnTime)
        }

        val totalDayElapsedMs = endTime - startTime
        var totalScreenOffMs = totalDayElapsedMs - totalScreenOnMs
        if (totalScreenOffMs < 0) totalScreenOffMs = 0 // Safety bounds clamp

        // Inject the summary metrics at index position 0 for Dart to pick up safely
        statsList.add(0, mapOf(
            "package" to "METRICS_SUMMARY_SYSTEM",
            "screenOnMinutes" to (totalScreenOnMs.toDouble() / 1000.0 / 60.0),
            "screenOffMinutes" to (totalScreenOffMs.toDouble() / 1000.0 / 60.0)
        ))

        return statsList
    }
}
