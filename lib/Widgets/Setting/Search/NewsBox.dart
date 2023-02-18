// import 'package:flutter/material.dart';

// class NewsBox extends StatelessWidget {
//   const NewsBox({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 100,
//       width: double.infinity,
//       decoration: BoxDecoration(
//         color: const Color(0xFF325568),
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.only(left: 5, top: 5, bottom: 5),
//         child: Row(children: [
//           Container(
//             clipBehavior: Clip.hardEdge,
//             decoration: const BoxDecoration(
//                 borderRadius: BorderRadius.all(Radius.circular(10))),
//             child: Image.asset(
//               'images/dummy-news.png',
//               width: 90,
//               height: 90,
//               fit: BoxFit.fill,
//             ),
//           ),
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.only(
//                   left: 8.0, top: 10, right: 26.0, bottom: 10),
//               child: Stack(children: [
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: const [
//                     Text(
//                       'Adani’s \$1,000 million FPO, India’s biggest-ever, opens for subscription',
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 14,
//                           fontWeight: FontWeight.w500),
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                     SizedBox(
//                       height: 9,
//                     ),
//                     Text(
//                       'The follow-on public offer (FPO) of Adani Enterprises',
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 10,
//                           fontWeight: FontWeight.w300),
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ],
//                 ),
//                 // Positioned(
//                 //   bottom: 0,
//                 //   right: 0,
//                 //   child: SvgPicture.asset('icons/threedots.svg'),
//                 // ),
//               ]),
//             ),
//           ),
//         ]),
//       ),
//     );
//   }
// }