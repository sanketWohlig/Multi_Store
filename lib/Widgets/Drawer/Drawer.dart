import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../../Provider/AuthProvider.dart';
import 'DrawerList.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 18.0, bottom: 10.0),
            child: Row(children: [
              Image.asset(
                'images/Ask-Us.png',
                height: 40,
                width: 40,
              ),
              const Text(
                'Ask Us',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF4B9CD6),
                ),
              ),
            ]),
          ),
          CustomDrawerList(),
        ],
      ),
    );
  }
}
