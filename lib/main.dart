import 'package:flutter/material.dart';

import 'package:untitled/transformer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Mytransformer(),
    );
  }
}

class DeepthPageTransformer extends PageTransformer {
  DeepthPageTransformer();

  @override
  Widget transform(Widget child, TransformInfo info) {
    double position = info.position;
    if (position <= 0) {
      return Opacity(
        opacity: 1.0,
        child: Transform.translate(
          offset: const Offset(0.0, 0.0),
          child: Transform.scale(
            scale: 1.0,
            child: child,
          ),
        ),
      );
    } else if (position <= 1) {
      // ignore: constant_identifier_names
      const double MIN_SCALE = 0.75;
      // Scale the page down (between MIN_SCALE and 1)
      double scaleFactor = MIN_SCALE + (1 - MIN_SCALE) * (1 - position * 0.7);

      return Opacity(
        opacity: 1.0,
        child: Transform.translate(
          offset:
              Offset(0.0, -position * info.height), // info.width * -position
          child: Transform.scale(
            scale: scaleFactor,
            child: child,
          ),
        ),
      );
    }

    return child;
  }
}

class Mytransformer extends StatefulWidget {
  const Mytransformer({super.key});

  @override
  State<Mytransformer> createState() => _MytransformerState();
}

class _MytransformerState extends State<Mytransformer> {
  final TransformerPageController _controller =
      TransformerPageController(itemCount: 10);
  @override
  Widget build(BuildContext context) {
    return TransformerPageView(
      onPageChanged: (value) {
        print(value);
      },
      index: 0,
      transformer: DeepthPageTransformer(),
      pageController: _controller,
      itemBuilder: (BuildContext context, int index) {
        return Scaffold(
          body: Container(
            color: index % 2 == 0 ? Colors.amber : Colors.deepOrangeAccent,
            child: Center(
              child: Text('Page $index'),
            ),
          ),
        );
      },
      itemCount: 10,
    );
  }
}
