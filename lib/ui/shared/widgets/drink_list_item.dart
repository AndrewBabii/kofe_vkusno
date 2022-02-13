import 'package:flutter/material.dart';

class BeverageListItem extends StatelessWidget{
  final ImageProvider picture;
  final String name;
  final String description;
  final Function onTap;

  const BeverageListItem({
    Key? key,
    required this.picture,
    required this.name,
    required this.description,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build (BuildContext context){
    return Container(
      decoration: const BoxDecoration(
          color: Color(0xFFFFE6D4),
          borderRadius: BorderRadius.all(Radius.circular(4)),
          boxShadow: [
            BoxShadow(
              color: Color(0x33000000),
              offset: Offset(0, 3),
              blurRadius: 5,
            ),
          ]),
      child: Material(
        color: const Color(0x00000000),
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius:
                      const BorderRadius.all(Radius.circular(4)),
                      border: Border.all(
                          color: const Color(0xFF422712), width: 3),
                    ),
                    child: Image(
                      fit: BoxFit.cover,
                      image: picture
                    )),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontFamily: 'Pangolin',
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        description,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 13,
                          fontFamily: 'Pangolin',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}