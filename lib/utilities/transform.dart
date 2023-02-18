// import 'package:flutter/material.dart';

// // import '../Widgets/Transfomer.dart';
// import '../transformer.dart';

// class DeepthPageTransformer extends PageTransformer {
//   DeepthPageTransformer();

//   @override
//   Widget transform(Widget child, TransformInfo info) {
    
//     double position = info.position;
//     if (position <= 0) {
//       return Opacity(
//         opacity: 1.0,
//         child: Transform.translate(
//           offset: const Offset(0.0, 0.0),
//           child: Transform.scale(
//             scale: 1.0,
//             child: child,
//           ),
//         ),
//       );
//     } else if (position <= 1) {
//       // ignore: constant_identifier_names
//       const double MIN_SCALE = 0.75;
//       // Scale the page down (between MIN_SCALE and 1)
//       double scaleFactor = MIN_SCALE + (1 - MIN_SCALE) * (1 - position * 0.7);

//       return Opacity(
//         opacity: 1.0,
//         child: Transform.translate(
//           offset:
//               Offset(0.0, -position * info.height), // info.width * -position
//           child: Transform.scale(
//             scale: scaleFactor,
//             child: child,
//           ),
//         ),
//       );
//     }

//     return child;
//   }
// }