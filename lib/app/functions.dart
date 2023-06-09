// import 'dart:io';

// import 'package:device_info_plus/device_info_plus.dart';
// import 'package:flutter/services.dart';
// import 'package:netify/app/extensions.dart';
// import 'package:netify/domain/model/model.dart';

// Future<DeviceInfo> getDeviceInfoDetails() async {
//   String name = 'Unknown';
//   String version = 'Unknown';
//   String identifier = 'Unknown';
//   String model = 'Unknown';
//   String manufacturer = 'Unknown';
//   String isPhysicalDevice = 'Unknown';
//   String systemName = 'Unknown';
//   String systemVersion = 'Unknown';

//   DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

//   try {
//     if (Platform.isAndroid) {
//       AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
//       name = androidInfo.model;
//       version = androidInfo.version.toString();
//       identifier = androidInfo.id;
//       model = androidInfo.model;
//       manufacturer = androidInfo.manufacturer;
//       isPhysicalDevice = androidInfo.isPhysicalDevice.toString();
//       systemName = 'Android';
//       systemVersion = androidInfo.version.release;
//     } else if (Platform.isIOS) {
//       IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
//       name = iosInfo.name;
//       version = iosInfo.systemVersion;
//       identifier = "Apple";
//       model = iosInfo.model;
//       manufacturer = 'Apple';
//       isPhysicalDevice = iosInfo.isPhysicalDevice.toString();
//       systemName = iosInfo.systemName;
//       systemVersion = iosInfo.systemVersion;
//     } else if (Platform.isLinux) {
//       LinuxDeviceInfo linuxInfo = await deviceInfo.linuxInfo;
//       name = linuxInfo.name;
//       version = linuxInfo.version.nonNull;
//       identifier = linuxInfo.id;
//       model = linuxInfo.machineId.nonNull;
//       manufacturer = linuxInfo.versionId.nonNull;
//       isPhysicalDevice = linuxInfo.runtimeType.toString();
//       systemName = linuxInfo.name;
//       systemVersion = linuxInfo.version.nonNull;
//     } else if (Platform.isMacOS) {
//       MacOsDeviceInfo macInfo = await deviceInfo.macOsInfo;
//       name = macInfo.computerName;
//       version = macInfo.osRelease;
//       identifier = macInfo.model;
//       model = macInfo.model;
//       manufacturer = macInfo.model;
//       isPhysicalDevice = macInfo.model;
//       systemName = macInfo.model;
//       systemVersion = macInfo.model;
//     } else if (Platform.isWindows) {
//       WindowsDeviceInfo windowsInfo = await deviceInfo.windowsInfo;
//       name = windowsInfo.computerName;
//       version = windowsInfo.computerName;
//       identifier = windowsInfo.computerName;
//       model = windowsInfo.computerName;
//       manufacturer = windowsInfo.computerName;
//       isPhysicalDevice = windowsInfo.computerName;
//       systemName = windowsInfo.computerName;
//       systemVersion = windowsInfo.computerName;
//     }
//   } on PlatformException {
//     print('Failed to get platform version');
//   }

//   return DeviceInfo(
//       name: name,
//       version: version,
//       identifier: identifier,
//       model: model,
//       manufacturer: manufacturer,
//       isPhysicalDevice: isPhysicalDevice,
//       systemName: systemName,
//       systemVersion: systemVersion);
// }
