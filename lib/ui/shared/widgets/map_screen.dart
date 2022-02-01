import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

LatLng initialLocation = LatLng(46.411955, 30.713078);
const String mapboxAccessToken =
    'pk.eyJ1IjoiYW5kcmV3YmFzIiwiYSI6ImNramE0czV1ajJ5aGQyeWxnaXhqa2gxNnkifQ.qqHT4mYLI7Spbi1XW5z7hg';
const String mapboxStyle = 'mapbox/dark-v10';

class MapScreen extends StatelessWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
        options: MapOptions(
          center: initialLocation,
          zoom: 13.0,
        ),
        layers: [
          TileLayerOptions(
            urlTemplate:
                'https://api.mapbox.com/styles/v1/ruslan-orolbaev/ckz40irqd000p15sxinr81vb1/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoicnVzbGFuLW9yb2xiYWV2IiwiYSI6ImNrejQwaDB0dzAzeDgydnA0MTR1bzV3bm4ifQ.bu9PV3iBeUOspRZG4kHnSw',
            additionalOptions: {
              'accessToken': mapboxAccessToken,
              'id': 'mapbox.mapbox-streets-v7'
            },
          ),
        ],
      ),
    );
  }
}
