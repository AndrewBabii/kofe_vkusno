import 'package:flutter/material.dart';
import 'package:kofe_vkusno/ui/shared/widgets/app_bar_custom/app_bar_custom.dart';
import 'package:kofe_vkusno/ui/shared/widgets/back_and_home_menu.dart';
import 'package:kofe_vkusno/ui/shared/widgets/coffee_drawer/coffee_drawer.dart';

class DrinkScreen extends StatelessWidget{
  final ImageProvider picture;
  final String description;

  const DrinkScreen({
    Key? key,
    required this.picture,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: const AppBarCustom(),
      drawer: coffeeDrawer,
      body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          color: const Color(0xFFEFC6AF),
          child: SingleChildScrollView(
            child: Column(
                children: [
                  const BackAndHome(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 50, 40, 30),
                      child: Container(
                        width: 280,
                        height: 280,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(4)),
                          border: Border.all(
                              color: const Color(0xFF422712), width: 3),
                        ),
                        child: Image(
                            fit: BoxFit.cover,
                            image: picture
                        ),
                      ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                        description,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        letterSpacing: 1.7,
                        fontSize: 16,
                        fontFamily: 'Pangolin',
                      ),
                    ),
                  ),
                ],
              ),
          ),
          ),
    );
  }
}