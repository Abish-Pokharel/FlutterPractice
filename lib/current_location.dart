import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CurrentLocation extends StatefulWidget {
  const CurrentLocation({super.key});

  @override
  State<CurrentLocation> createState() => _CurrentLocationState();
}

class _CurrentLocationState extends State<CurrentLocation> {
  // Position? currentLocation;
  // @override
  // void initState() {
  //   _determinePosition();
  //   super.initState();
  // }

  // Future _determinePosition() async {
  //   bool serviceEnabled;
  //   LocationPermission permission;
  //   Position? location;

  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) {
  //     return Future.error('Location services are disabled.');
  //   }

  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.denied) {
  //       return Future.error('Location permissions are denied');
  //     }
  //   }

  //   if (permission == LocationPermission.deniedForever) {
  //     return Future.error(
  //         'Location permissions are permanently denied, we cannot request permissions.');
  //   }

  //   location = await Geolocator.getCurrentPosition();

  //   setState(() {
  //     currentLocation = location;
  //   });
  //   print("${currentLocation?.latitude}");
  //   print("${currentLocation?.longitude}");
  // }

  static final Marker _nepal = Marker(
    markerId: MarkerId('Abish'),
    infoWindow: InfoWindow(title: "Nepal"),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(37.42796133580664, -122.085749655962),
  );

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GoogleMap(
      initialCameraPosition:
          CameraPosition(target: LatLng(27.6667, 83.4333), zoom: 14),
      mapType: MapType.terrain,
      markers: {
        Marker(
            markerId: MarkerId("00001"),
            position: LatLng(27.6667, 83.4333),
            draggable: true,
            onDragEnd: (latlng) {
              log(latlng.latitude.toString());
            }),
        Marker(
            markerId: MarkerId("002"), position: LatLng(27.700769, 85.300140)),
      },
      onTap: (data) {
        log(data.latitude.toString());

        _goToTheLake(data);
      },
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    )
        // GoogleMap(
        //   scrollGesturesEnabled: true,
        //   zoomControlsEnabled: true,
        //   tiltGesturesEnabled: true,
        //   markers: {_nepal},
        //   compassEnabled: true,
        //   onTap: (latlng) {},
        //   mapType: MapType.satellite,
        //   initialCameraPosition: _kGooglePlex,
        // onMapCreated: (GoogleMapController controller) {
        //   _controller.complete(controller);
        // },
        // ),
        // floatingActionButton: FloatingActionButton.extended(
        //   onPressed: _goToTheLake,
        //   label: const Text('To the lake!'),
        //   icon: const Icon(
        //     Icons.directions_boat,
        //   ),
        // ),
        );
  }

  Future<void> _goToTheLake(LatLng pos) async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
            bearing: 192.8334901395799,
            target: pos,
            tilt: 59.440717697143555,
            zoom: 14)));
  }
}
