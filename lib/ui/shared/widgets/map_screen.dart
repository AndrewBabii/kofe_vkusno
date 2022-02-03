import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

const String mapboxAccessToken =
    'pk.eyJ1IjoicnVzbGFuLW9yb2xiYWV2IiwiYSI6ImNrejQwcXB4djBiemMyb3BkMTRsa2U4YmsifQ.9pFjuIEZUEtHGZcVCRUN8g';

class MapScreen extends StatelessWidget {
  MapScreen({Key? key}) : super(key: key);

  final LatLng initialLocation = LatLng(46.411955, 30.713078);
  final double mapZoom = 13.0;
  final String styleURL =
      'https://api.mapbox.com/styles/v1/ruslan-orolbaev/ckz40irqd000p15sxinr81vb1/tiles/256/{z}/{x}/{y}@2x?access_token=$mapboxAccessToken';
  final Map<String, String> mapOptions = {
    'accessToken': mapboxAccessToken,
    'id': 'mapbox.mapbox-streets-v7'
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
        options: MapOptions(
          center: initialLocation,
          zoom: mapZoom,
        ),
        layers: [
          TileLayerOptions(
            urlTemplate: styleURL,
            additionalOptions: mapOptions,
          ),
        ],
      ),
    );
  }
}
