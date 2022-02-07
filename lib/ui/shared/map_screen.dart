import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:kofe_vkusno/global/const/map_box_settings.dart';
import 'package:kofe_vkusno/global/const/urls.dart';
import 'package:latlong2/latlong.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(initialLatitude, initialLongitude),
          zoom: initialMapZoom,
        ),
        layers: [
          TileLayerOptions(
            urlTemplate: mapBoxStyleURL,
            additionalOptions: tileLayerOptions,
          ),
        ],
      ),
    );
  }
}
