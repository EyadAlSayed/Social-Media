
import 'dart:io';

import 'package:package_info_plus/package_info_plus.dart';

/**
 * Created by Eng.Eyad AlSayed on 10/7/2024.
 */
abstract class AppInfoHelper {
  static PackageInfo? packageInfo;

  static bool isIOS() {
    return Platform.isIOS;
  }

  static bool isAndroid() {
    return Platform.isAndroid;
  }

  static String getAppVersion() {
    return packageInfo?.version ?? "";
  }
}
