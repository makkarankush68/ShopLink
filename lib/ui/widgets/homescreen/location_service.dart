import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocationService extends StatefulWidget {
  const LocationService({
    super.key,
  });
  @override
  State<LocationService> createState() => _LocationServiceState();
}

class _LocationServiceState extends State<LocationService> {
  String _currentAddress = 'Your Address';
  bool _isLoading = false;
  bool _showUpdateButton = false;
  final ValueNotifier<bool> _locationFetchedNotifier =
      ValueNotifier(false); // Using ValueNotifier

  @override
  void initState() {
    super.initState();
    _getLocationFromStorage();
    // print("LocationService: initState");
    _getCurrentLocationOnce();
  }

  Future<void> _getLocationFromStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    double? savedLat = prefs.getDouble('latitude');
    double? savedLon = prefs.getDouble('longitude');
    String? savedAddress = prefs.getString("address");
    if (savedAddress != null) {
      if (mounted) {
        setState(() {
          _currentAddress = savedAddress;
        });
      }
      return;
    }

    if (savedLat != null && savedLon != null) {
      _fetchAddress(savedLat, savedLon);
    }
  }

  Future<void> _getCurrentLocationOnce() async {
    _locationFetchedNotifier.addListener(() {
      if (_locationFetchedNotifier.value) {
        return; // Check if location has already been fetched
      }

      setState(() {
        _isLoading = true;
      });

      _determinePosition().then((position) async {
        await _fetchAddress(position.latitude, position.longitude);

        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setDouble('latitude', position.latitude);
        prefs.setDouble('longitude', position.longitude);

        _locationFetchedNotifier.value =
            true; // Set the notifier value to true after fetching location
      }).catchError((e) {
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
        }
        if (_showUpdateButton) {
          Fluttertoast.showToast(
            msg: 'Failed to get location: ${e.toString()}',
            toastLength: Toast.LENGTH_SHORT,
            timeInSecForIosWeb: 1,
            gravity: ToastGravity.BOTTOM,
          );
        }
      });
    });
  }

  Future<void> _getCurrentLocation() async {
    setState(() {
      _isLoading = true;
    });

    try {
      Position position = await _determinePosition();
      await _fetchAddress(position.latitude, position.longitude);

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setDouble('latitude', position.latitude);
      prefs.setDouble('longitude', position.longitude);
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
      Fluttertoast.showToast(
        msg: 'Failed to get location: ${e.toString()}',
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 1,
        gravity: ToastGravity.BOTTOM,
      );
    }
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw PlatformException(
        code: 'LOCATION_SERVICE_DISABLED',
        message: 'Location services are disabled.',
      );
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw PlatformException(
          code: 'LOCATION_PERMISSION_DENIED',
          message: 'Location permissions are denied.',
        );
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw PlatformException(
        code: 'LOCATION_PERMISSION_DENIED_FOREVER',
        message: 'Location permissions are permanently denied.',
      );
    }

    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best,
    );
  }

  void _setAddressToStorage(String address) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("address", address);
  }

  Future<void> _fetchAddress(double lat, double lon) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(lat, lon);
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        if (mounted) {
          setState(() {
            _currentAddress =
                "${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}";
            _setAddressToStorage(_currentAddress);
          });
        }
      } else {
        if (mounted) {
          setState(() {
            _currentAddress = 'No address available';
          });
        }
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: 'Failed to fetch address: ${e.toString()}',
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 1,
        gravity: ToastGravity.BOTTOM,
      );
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _toggleUpdateButton() {
    setState(() {
      _showUpdateButton = !_showUpdateButton;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (_isLoading)
          const CircularProgressIndicator()
        else
          Column(
            children: [
              InkWell(
                onTap: _toggleUpdateButton,
                child: Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: Colors.black54,
                    ),
                    Expanded(
                      child: Text(
                        _currentAddress,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (_showUpdateButton)
                TextButton(
                  onPressed: _getCurrentLocation,
                  child: const Text("Update Location"),
                ),
              const SizedBox(height: 8),
            ],
          ),
      ],
    );
  }

  @override
  void dispose() {
    _locationFetchedNotifier.dispose(); // Dispose the ValueNotifier
    super.dispose();
  }
}
