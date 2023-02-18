import 'package:flutter/material.dart';

class DrawerDivider extends StatelessWidget {
  const DrawerDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Divider(
          height: 1,
          thickness: 0.2,
          color: Colors.black,
        ),
      ],
    );
  }
}
