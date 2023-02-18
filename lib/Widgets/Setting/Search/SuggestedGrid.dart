import 'package:flutter/material.dart';

class SuggestedGrid extends StatelessWidget {
  const SuggestedGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: GridView.builder(
          itemCount: 9,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 114 / 162,
              crossAxisCount: 3,
              crossAxisSpacing: 5.0,
              mainAxisSpacing: 7.0),
          itemBuilder: (context, int index) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.amber,
                ),
              )),
    );
  }
}
