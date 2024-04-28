import 'package:app_settings/app_settings.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:geocoding/geocoding.dart';
import 'package:wework/models/user_location.dart';
import 'package:wework/services/location_service.dart';

abstract class ApplicationRepo {
  Future<UserLocation?> getUserLocation();
  Future<bool> checkConnectivity();
  void openApplicationSettings();
}

class ApplicationRepoImpl implements ApplicationRepo {
  LocationService locationService;
  ApplicationRepoImpl() : locationService = LocationService();
  @override
  Future<UserLocation> getUserLocation() async {
    try {
      var position = await locationService.determinePosition();
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      return UserLocation(
        mainAddress: placemarks.first.name ?? "",
        subAddress:
            "${placemarks.first.street ?? ""}, ${placemarks.first.subAdministrativeArea ?? ""}",
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> checkConnectivity() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }

  @override
  void openApplicationSettings() {
    AppSettings.openAppSettings(type: AppSettingsType.location);
  }
}
