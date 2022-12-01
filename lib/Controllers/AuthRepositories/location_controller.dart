import 'dart:async';
import 'dart:developer';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class LocationController extends GetxController {
  RxBool hasLocationPermission = false.obs;

  RxString long = "".obs;
  RxString lat = "".obs;
  late StreamSubscription<Position> positionSetting;
  @override
  void onInit() {
    checkLocationServices();

    super.onInit();
  }

  @override
  void onClose() {

    super.onClose();
    positionSetting.cancel();
  }

  void checkLocationServices() async {
    bool serviceEnabled = false;

    LocationPermission locationPermission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (serviceEnabled) {
      locationPermission = await Geolocator.checkPermission();

      if (locationPermission == LocationPermission.denied) {
        locationPermission = await Geolocator.requestPermission();

        if (locationPermission == LocationPermission.denied) {
          Get.snackbar(
              "Location Permission", "location permission not granted ",
              snackPosition: SnackPosition.BOTTOM,
              duration: const Duration(milliseconds: 3));
        } else if (locationPermission == LocationPermission.deniedForever) {
        } else {
          hasLocationPermission.value = true;

          getLocation();
        }
      } else {
        hasLocationPermission.value = true;

        getLocation();
      }
    } else {
      Get.snackbar(
              "GPS Permission", "GPS permission not granted ",
              snackPosition: SnackPosition.BOTTOM,
              duration: const Duration(milliseconds: 3));
    }
  }

  void getLocation() {
    positionSetting = Geolocator.getPositionStream().listen((event) {
      long.value = event.longitude.toString();
      lat.value = event.latitude.toString();
    });
  }
}
