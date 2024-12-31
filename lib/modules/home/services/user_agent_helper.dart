import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';

class UserAgentHelper {
  static Future<String> getUserAgent() async {
    final deviceInfo = DeviceInfoPlugin();
    final packageInfo = await PackageInfo.fromPlatform();
    
    if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      return 'Mozilla/5.0 (Linux; Android ${androidInfo.version.release}; ${androidInfo.model}) '
          'AppleWebKit/537.36 (KHTML, like Gecko) Chrome/Mobile Safari/537.36 '
          '${packageInfo.appName}/${packageInfo.version}';
    } else if (Platform.isIOS) {
      final iosInfo = await deviceInfo.iosInfo;
      return 'Mozilla/5.0 (${iosInfo.utsname.machine}; CPU iPhone OS ${iosInfo.systemVersion} like Mac OS X) '
          'AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 '
          '${packageInfo.appName}/${packageInfo.version}';
    }
    return 'Unknown/0.0.0';
  }
}