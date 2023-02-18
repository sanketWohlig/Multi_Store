import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Provider/AuthProvider.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  final String? title;
  const MyAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Center(
        child: Text(
          title.toString(),
        ),
      ),
      actions: [
        IconButton(
            onPressed: () {
              // final provider =
              //     Provider.of<GoogleSignInProvider>(context, listen: false);
              // provider.googleLogOut(context);
            },
            tooltip: 'LogOut',
            icon: const Icon(
              Icons.logout,
            ))
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
