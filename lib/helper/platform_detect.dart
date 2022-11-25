import 'dart:io';

class PlatformDetect {
  static bool isComputer() =>
      Platform.isWindows || Platform.isLinux || Platform.isMacOS;
  static bool isPhone() => Platform.isAndroid || Platform.isIOS;
}
