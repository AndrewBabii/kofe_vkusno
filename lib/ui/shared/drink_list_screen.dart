import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kofe_vkusno/core/models/beverage.dart';
import 'package:kofe_vkusno/core/repositories/beverage_json_repository.dart';
import 'package:kofe_vkusno/core/repositories/beverage_repository.dart';
import 'package:kofe_vkusno/ui/shared/widgets/app_bar_custom/app_bar_custom.dart';
import 'package:kofe_vkusno/ui/shared/widgets/back_and_home_menu.dart';
import 'package:kofe_vkusno/ui/shared/widgets/drink_list_item.dart';
import 'package:kofe_vkusno/ui/shared/widgets/coffee_drawer/coffee_drawer.dart';

class BeverageList extends StatelessWidget {
  const BeverageList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(),
      drawer: coffeeDrawer,
      body: Container(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
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
                    padding: const EdgeInsets.only(top: 15),
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
        List<Beverage>? beverages = snapshot.data;
        if (snapshot.hasData) {
          return ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(height: 20),
            itemCount: beverages?.length ?? 0,
            itemBuilder: (context, index) {
              return BeverageListItem(
                picture: beverages?[index].picture ??
                    const AssetImage(
                        "resources/images/beverage/beverage_01.png"),
                name: beverages?[index].name ?? "No name",
                description: beverages?[index].description ??
                    "No description",
                onTap: () {},
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
