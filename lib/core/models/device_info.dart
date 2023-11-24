import 'package:flutter/cupertino.dart';
import 'package:pokemon/core/constants/device_type_enum.dart';

class DeviceInfo {
  Orientation? orientation;
  DeviceType? deviceType;
  double? screenWidth;
  double? screenHeight;
  double? localWidth;
  double? localHeight;

  DeviceInfo(
      {this.orientation,
      this.deviceType,
      this.screenWidth,
      this.screenHeight,
      this.localWidth,
      this.localHeight});
}
