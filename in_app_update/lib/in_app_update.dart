library in_app_update;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:package_info/package_info.dart';
import 'package:url_launcher/url_launcher_string.dart';

class InAppUpdate {
  String tag = "InAppUpdate";
  static late PackageInfo packageInfo;
  static late FirebaseFirestore _db;

  static Future<void> init() async {
    packageInfo = await PackageInfo.fromPlatform();
    _db = FirebaseFirestore.instance;
  }

  static Future<void> checkUpdate(
    BuildContext context,
    String googlePlayLink,
  ) async {
    final DocumentSnapshot<Map<String, dynamic>> response =
        await _db.collection("Version").doc(packageInfo.packageName).get();
    final Map<String, dynamic>? data = response.data();
    if (data != null) {
      if (data['version'] != packageInfo.version ||
          data['build_number'] != packageInfo.buildNumber) {
        final bool? result = await showDialog<bool>(
          context: context,
          barrierDismissible: false,
          builder: (context) => AlertDialog(
            title: Row(
              children: [
                SizedBox(
                  width: 50,
                  height: 50,
                  child: Image.asset("images/icon.png"),
                ),
                const Text("Update available!"),
              ],
            ),
            content: const Text("Please update the app for new features."),
            actions: [
              TextButton.icon(
                onPressed: () {
                  Navigator.pop(context, false);
                },
                icon: const Icon(Icons.close),
                label: const Text("Skip"),
              ),
              TextButton.icon(
                onPressed: () async {
                  Navigator.pop(context, true);
                },
                icon: const Icon(Icons.done),
                label: const Text("Update now"),
              ),
            ],
          ),
        );
        if (result != null) {
          if (result) {
            if (await canLaunchUrlString(googlePlayLink)) {
              await launchUrlString(googlePlayLink);
              SystemNavigator.pop();
            }
          }
        }
      }
    }
  }
}
