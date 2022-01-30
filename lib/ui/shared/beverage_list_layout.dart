import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kofe_vkusno/core/models/beverage.dart';
import 'package:kofe_vkusno/core/repository/beverage_json_repository.dart';
import 'package:kofe_vkusno/core/repository/beverage_repository.dart';
import 'package:kofe_vkusno/ui/shared/widgets/app_bar_custom/app_bar_custom.dart';
import 'package:kofe_vkusno/ui/shared/widgets/back_and_home_menu.dart';

class BeverageList extends StatelessWidget {
  static Route route(){
    return MaterialPageRoute(builder: (context) => const BeverageList());
  }
  const BeverageList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(),
      drawer: const Drawer(
        backgroundColor: Color(0xFFFFF7e5),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
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
          children: [
            const BackAndHome(),
            Expanded(
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
                    child: _Body()))
          ],
        ),
      ),
    );
  }
}

final beverageRepository = Provider((_) => BeverageJSONRepository());

class _Body extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final BeverageRepository repository = ref.watch(beverageRepository);

    return FutureBuilder(
      future: repository.getBeverageList(),
      builder: (context, AsyncSnapshot<List<Beverage>> snapshot) {
        if (snapshot.hasData) {
          return ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(height: 25),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return SizedBox(
                height: 110.0,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image(
                          fit: BoxFit.fill,
                          image: snapshot.data![index].picture,
                          width: 100,
                          height: 110,
                        )),
                    const SizedBox(width: 8),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(snapshot.data![index].name,
                            style: const TextStyle(
                                fontSize: 18, fontFamily: 'Pangolin')),
                        Text(snapshot.data![index].description,
                            style: const TextStyle(
                                fontSize: 13, fontFamily: 'Pangolin')),
                      ],
                    ))
                  ],
                ),
              );
            },
          );
        } else {
          return const LinearProgressIndicator();
        }
      },
    );
  }
}
