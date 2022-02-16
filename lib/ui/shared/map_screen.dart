import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kofe_vkusno/global/const/map_box_settings.dart';
import 'package:kofe_vkusno/global/const/urls.dart';
import 'package:kofe_vkusno/ui/shared/widgets/app_bar_custom/app_bar_custom.dart';
import 'package:kofe_vkusno/ui/shared/widgets/back_and_home_menu.dart';
import 'package:kofe_vkusno/ui/shared/widgets/coffee_drawer/coffee_drawer.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({Key? key}) : super(key: key);
  static TextStyle textStyle18 =
      const TextStyle(fontSize: 18, fontFamily: 'Pangolin');
  static TextStyle textStyle16 =
      const TextStyle(fontSize: 16, fontFamily: 'Pangolin');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(),
      drawer: coffeeDrawer,
      body: Container(
        padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.2), BlendMode.dstATop),
            image: const AssetImage("resources/images/background_01.png"),
            fit: BoxFit.cover,
          ),
          color: const Color(0xFFFFE6D4),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BackAndHome(),
            const SizedBox(height: 20),
            Center(
              child: Text("greetings".tr(),
                  style: textStyle18, textAlign: TextAlign.center),
            ),
            const SizedBox(height: 10),
            Center(
              child: Text("working_hours".tr(),
                  style: textStyle18, textAlign: TextAlign.center),
            ),
            const SizedBox(height: 30),
            Text("email".tr(), style: textStyle16),
            const SizedBox(height: 10),
            _Instagram(),
            const SizedBox(height: 10),
            Text("address".tr(), style: textStyle16),
            const SizedBox(height: 10),
            Text("phone".tr(), style: textStyle16),
            const SizedBox(height: 40),
            Flexible(
                child: _Map())
          ],
        ),
      ),
    );
  }
}

class _Map extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.width - 60,
      ),
      decoration: BoxDecoration(
        border: Border.all(width: 3.0, color: const Color(0xFF422712)),
        borderRadius: const BorderRadius.all(Radius.circular(4.0)),
      ),
      child: FlutterMap(
        options: MapOptions(
          center: LatLng(initialLatitude, initialLongitude),
          zoom: initialMapZoom,
        ),
        layers: [
          TileLayerOptions(
            urlTemplate: mapBoxStyleURL,
            additionalOptions: tileLayerOptions,
          ),
          MarkerLayerOptions(
            markers: [
              Marker(
                width: 80.0,
                height: 40.0,
                point: LatLng(initialLatitude, initialLongitude),
                builder: (ctx) =>Column(
                  children: [
                    Text("Мы здесь".tr(),style: const TextStyle(fontFamily: 'Pangolin',color: Color(0xFF422712))),
                    SvgPicture.asset('resources/icons/menu_icon.svg')
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Instagram extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await launch(
          instagramURL,
          universalLinksOnly: true,
        );
      },
      child: Row(children: [
        Container(
            decoration: const BoxDecoration(
                color: Color(0xFFFEF750), shape: BoxShape.circle),
            child: Padding(
              padding: const EdgeInsets.all(5.125),
              child: SizedBox(
                  child: SvgPicture.asset(
                    "resources/icons/instagram_icon.svg",
                    height: 9.75,
                    width: 9.75,
                  )),
            )),
        const SizedBox(width: 10),
        Text("instagram".tr(), style: const TextStyle(fontSize: 16, fontFamily: 'Pangolin'))
      ]),
    );
  }

}
