part of sizer;

class SizerUtil {
  /// Device's BoxConstraints
  static BoxConstraints? boxConstraints;

  /// Device's Orientation
  static Orientation? orientation;

  /// Type of Device
  ///
  /// This can either be mobile or tablet
  static DeviceType? deviceType;

  /// Device's Height
  static double? height;

  /// Device's Width
  static double? width;

  /// Sets the Screen's size and Device's Orientation,
  /// BoxConstraints, Height, and Width
  static void setScreenSize(
      BoxConstraints constraints, Orientation currentOrientation) {
    // Sets boxconstraints and orientation
    boxConstraints = constraints;
    orientation = currentOrientation;

    // Sets screen width and height
    if (orientation == Orientation.portrait) {
      width = boxConstraints!.maxWidth;
      height = boxConstraints!.maxHeight;
    } else {
      width = boxConstraints!.maxHeight;
      height = boxConstraints!.maxWidth;
    }

    // Sets ScreenType
    if (kIsWeb) {
      deviceType = DeviceType.web;
    } else if (GetPlatform.isAndroid || GetPlatform.isIOS) {
      if ((orientation == Orientation.portrait && width! < 600) ||
          (orientation == Orientation.landscape && height! < 600)) {
        deviceType = DeviceType.mobile;
      } else {
        deviceType = DeviceType.tablet;
      }
    } else if (GetPlatform.isMacOS) {
      deviceType = DeviceType.mac;
    } else if (GetPlatform.isWindows) {
      deviceType = DeviceType.windows;
    } else if (GetPlatform.isLinux) {
      deviceType = DeviceType.linux;
    } else {
      deviceType = DeviceType.fuchsia;
    }
  }
}

/// Type of Device
///
/// This can be either mobile or tablet
enum DeviceType { mobile, tablet, web, mac, windows, linux, fuchsia }
