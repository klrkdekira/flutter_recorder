import 'dart:async';

import 'package:location/location.dart';

class LocationService {
  LocationService() {
    _location.requestPermission().then((granted) {
      if (granted == PermissionStatus.granted) {
        _location.onLocationChanged.listen((locationData) {
          _locationController.add(locationData);
        });
      }
    });
  }

  LocationData _here;

  var _location = Location();

  Future<LocationData> getLocation() async {
    try {
      var here = await _location.getLocation();
      _here = here;
    } on Exception catch (e) {
      print('unable to get location: ${e.toString()}');
    }
    return _here;
  }

  var _locationController = StreamController<LocationData>();

  Stream<LocationData> get locationStream => _locationController.stream;
}
