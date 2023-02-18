import 'package:flutter/material.dart';

class UnseenStoriesPage extends StatelessWidget {
  const UnseenStoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        drawer: Drawer(),
        body: Center(child: Text('Your Unseen Stories')),
      ),
    );
  }
}
