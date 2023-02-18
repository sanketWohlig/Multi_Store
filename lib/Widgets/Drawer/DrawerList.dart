import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Provider/loaderProvider.dart';
import '../../utilities/drawelist.dart';
// import 'Divider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'Divider.dart';

class CustomDrawerList extends StatefulWidget {
  const CustomDrawerList({super.key});

  @override
  State<CustomDrawerList> createState() => _CustomDrawerListState();
}

class _CustomDrawerListState extends State<CustomDrawerList> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: List.generate(
        items.length,
        ((index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 7.0),
              child:
                  Consumer<LoadingProvider>(builder: (context, value, child) {
                return InkWell(
                  onTap: () {
                    // setState(() {
                    //   for (var element in items) {
                    //     element.color = false;
                    //   }
                    //   items[index].color = !items[index].color!;
                    // });
                    if (index == 0) {
                      value.setDrawerIndex(index);
                      Navigator.pushReplacementNamed(
                          context, items[index].route!);
                    }
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      index == 3 || index == 7 || index == 0
                          ? Column(
                              children: const [
                                DrawerDivider(),
                                SizedBox(
                                  height: 8.0,
                                ),
                              ],
                            )
                          : Container(),
                      Stack(fit: StackFit.loose, children: [
                        // Consumer<LoadingProvider>(
                        //   builder: (context,value,child){
                        Container(
                          decoration: BoxDecoration(
                            color: value.drawerInder == index
                                ? const Color(0xFFD7E9F1)
                                : null,
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(100),
                                bottomRight: Radius.circular(100)),
                          ),
                          width: MediaQuery.of(context).size.width * 0.7 - 30,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 8.0, bottom: 8.0, left: 33),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                SizedBox(
                                  width: 15,
                                  child: Center(
                                    child: FaIcon(
                                      items[index].icon,
                                      size: 15,
                                      color: const Color(0xFF315466),
                                    ),
                                  ),
                                  // child: Icon(items[index].icon)
                                ),
                                const SizedBox(
                                  width: 21,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      items[index].title.toString(),
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                    index != 0
                                        ? const Text(
                                            ' (Coming Soon...)',
                                            style: TextStyle(fontSize: 12),
                                            // maxLines: 3,
                                          )
                                        : Container(),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                        //   }
                        //   // child:
                        // ),
                      ]),
                    ],
                  ),
                );
              }
                      // child:
                      ),
            )),
      ),
    );
  }
}
