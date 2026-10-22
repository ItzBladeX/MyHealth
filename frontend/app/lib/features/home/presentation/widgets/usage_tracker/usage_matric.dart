import 'package:app/core/constants.dart';
import 'package:app/features/home/presentation/widgets/usage_tracker/screen_of.dart';
import 'package:app/features/home/presentation/widgets/usage_tracker/screen_time.dart';
import 'package:app/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

class UsageMatric extends StatefulWidget {
  const new({super.key});

  @override
  State<UsageMatric> createState() => _UsageMatricState();
}

class _UsageMatricState extends State<UsageMatric> with WidgetsBindingObserver {
  static const platform = MethodChannel('com.myhealth.app/stats');
  Map<String, dynamic>? usageData;
  bool permission = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) loadUsage(context);
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) loadUsage(context);
  }

  Future<void> loadUsage(BuildContext context) async {
    final userProvider = context.read<UserProvider>();
    await userProvider.loadUsageData();
    if (!mounted) return;

    final data = userProvider.usageData;
    setState(() {
      usageData = data;
      permission = data != null;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!permission) {
      return NoPermission(platform: platform, loadUsage: loadUsage);
    }
    return Permission();
  }
}

class Permission extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16),
      constraints: const BoxConstraints(maxWidth: 560),
      child: LayoutBuilder(
        builder: (context, constraints) {
          const double minWidth = 180.0;
          const double spacing = 8.0;

          bool canFitSideBySide =
              constraints.maxWidth >= (minWidth * 2) + spacing;
          double dynamicWidth = canFitSideBySide
              ? (constraints.maxWidth - spacing) / 2
              : 560.0;
          double maxItemWidth = canFitSideBySide
              ? (560.0 - spacing) / 2
              : 560.0;

          return Wrap(
            spacing: spacing,
            runSpacing: spacing,
            alignment: WrapAlignment.center,
            children: [
              Container(
                width: dynamicWidth,
                constraints: BoxConstraints(
                  minWidth: minWidth,
                  maxWidth: maxItemWidth,
                ),
                child: const ScreenOff(),
              ),
              Container(
                width: dynamicWidth,
                constraints: BoxConstraints(
                  minWidth: minWidth,
                  maxWidth: maxItemWidth,
                ),
                child: const ScreenTime(),
              ),
            ],
          );
        },
      ),
    );
  }
}

class NoPermission extends StatelessWidget {
  const new({super.key, required this.platform, required this.loadUsage});
  final Future<void> Function(BuildContext) loadUsage;
  final MethodChannel platform;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.only(left: 16, right: 16),
        constraints: BoxConstraints(maxWidth: 560),
        decoration: BoxDecoration(
          color: ColorConstants.cardBackground,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.03),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.security, size: 64, color: Colors.grey),
              const SizedBox(height: 16),
              const Text(
                'Permission Required',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Android requires usage tracking permission to analyze your screen runtimes.',
                  textAlign: TextAlign.center,
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onPressed: () async {
                  await platform.invokeMethod('grantPermission');
                  if (!context.mounted) return;
                  await loadUsage(context);
                },
                child: const Text(
                  'Grant Access',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
