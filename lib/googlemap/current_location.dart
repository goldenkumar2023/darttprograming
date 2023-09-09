import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class Currentlocation extends StatefulWidget {
  const Currentlocation({Key? key}) : super(key: key);

  @override
  State<Currentlocation> createState() => _CurrentlocationState();
}

class _CurrentlocationState extends State<Currentlocation> {

  GoogleMapController? mapController;
  LocationData? currentLocation;

  @override

  void initState() {
    super.initState();
    initializeLocation();
  }

  void initializeLocation() async {
    Location location = Location();
    bool _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    PermissionStatus _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    LocationData locationData = await location.getLocation();
    setState(() {
      currentLocation = locationData;
    });
  }
  @override

  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Current Location'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (currentLocation != null)
              Text(
                'Latitude: ${currentLocation!.latitude}\nLongitude: ${currentLocation!.longitude}',
                textAlign: TextAlign.center,
              ),
            SizedBox(height: 20),
            if (currentLocation != null)
              Container(
                height: 300,
                width: double.infinity,
                child: GoogleMap(
                  onMapCreated: (controller) {
                    setState(() {
                      mapController = controller;
                    });
                  },
                  initialCameraPosition: CameraPosition(
                    target: LatLng(
                      currentLocation!.latitude!,
                      currentLocation!.longitude!,
                    ),
                    zoom: 15,
                  ),
                  markers: Set<Marker>.from([
                    Marker(
                      markerId: MarkerId('currentLocation'),
                      position: LatLng(
                        currentLocation!.latitude!,
                        currentLocation!.longitude!,
                      ),
                    ),
                  ]),
                ),
              ),
          ],
        ),
      ),
    );
  }
}


