import 'dart:async';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class LocationController extends GetxController {
  late StreamSubscription<Position> streamLocation;
  late StreamSubscription<DateTime> streamDateTime;

  RxDouble lat = 0.0.obs;
  RxDouble long = 0.0.obs;
  var address = ''.obs;
  var currentTime = ''.obs;
  var currentDate = ''.obs;

  @override
  void onInit() async {
    _getLocation();
    _updateDateTime();
    super.onInit();
  }
 
  _getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    streamLocation = Geolocator.getPositionStream().listen(
      (Position position) async {
        lat.value = position.latitude;
        long.value = position.longitude;
        await getAddressFromLatLang(position);
      },
    );
  }

  Future<void> getAddressFromLatLang(Position position) async {
    List<Placemark> placemark =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemark[0];
    address.value =
        "${place.street}, ${place.subLocality}, ${place.locality}-${place.postalCode}"
            .toString();
  }

  void _updateDateTime() {
    streamDateTime = Stream<DateTime>.periodic(Duration(seconds: 1), (index) {
      return DateTime.now();
    }).listen((dateTime) {
      currentTime.value = "${DateFormat('hh:mm:ss').format(
        DateTime.parse("${dateTime}"),
      )}";
      currentDate.value = "${DateFormat('yyyy-MM-dd').format(
        DateTime.parse("${dateTime}"),
      )}";
    });
  }

  @override
  void onClose() {
    streamLocation.cancel();
    streamDateTime.cancel();
    super.onClose();
  }
}
