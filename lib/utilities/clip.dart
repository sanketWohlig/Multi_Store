// import 'dart:math';
// import 'package:flutter/material.dart';

// class ClipRThread extends CustomClipper<Path> {
//   final double chatRadius;

//   ClipRThread(this.chatRadius);

//   @override
//   // Path getClip(Size size) {
//   // final path = Path();
//   // path.lineTo(0.0, chatRadius);
//   // // path.lineTo(chatRadius, chatRadius + chatRadius / 2);
//   static const r = 10;
//   static const angle = 0.785;
//   // path.conicTo(
//   //   r - r * sin(angle),
//   //   r + r * cos(angle),
//   //   r - r * sin(angle * 0.5),
//   //   r + r * cos(angle * 0.5),
//   //   1,
//   // );

//   static const moveIn = 10; // need to be > 2 * r
//   // path.lineTo(moveIn, r + moveIn);

//   // path.lineTo(moveIn, size.height - chatRadius);

//   // path.conicTo(
//   //   moveIn + r - r * cos(angle),
//   //   size.height - r + r * sin(angle),
//   //   moveIn + r,
//   //   size.height,
//   //   1,
//   // );

//   // path.lineTo(size.width, size.height);
//   // path.lineTo(size.width, 0.0);

//   // path.close();
//   // return path;
//   Path getClip(Size size) {
//     Path path = Path();
//     // path.lineTo(-8.0, size.height);
//     // path.lineTo(size.width - 8, size.height);
//     // path.conicTo(
//     //   10.0 * 10 * cos(0.5),
//     //   10.0 * 10 * sin(0.5),
//     //   20,
//     //   size.height,
//     //   1,
//     // );
//     // path.lineTo(size.width - 8.0, 8.0);

//     // path.lineTo(size.width, 0.0);
//     path.lineTo(0.0, -8.0);
//     path.lineTo(8.0, 8.0);
//     path.lineTo(8.0, size.height);

//     path.lineTo(size.width, size.height);

//     path.lineTo(size.width, 0.0);
//     path.close();
//     return path;
//   }
//   // }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) {
//     return false;
//   }
// }
