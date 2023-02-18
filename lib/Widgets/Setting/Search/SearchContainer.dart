// import 'package:flutter/material.dart';

// import '../../../SubScreens/SearchBar.dart';

// class SearchContainer extends StatelessWidget {
//   const SearchContainer({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () => Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => const SearchBar(),
//           )),
//       child: Hero(
//         tag: 'search',
//         child: Container(
//           height: 35,
//           decoration: BoxDecoration(
//             color: const Color(0xFFF5F5F5),
//             border: Border.all(
//                 color: const Color(0xFF9C9C9C),
//                 width: 1.0,
//                 style: BorderStyle.solid,
//                 strokeAlign: BorderSide.strokeAlignInside),
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: Row(children: const [
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 10),
//               child: Icon(
//                 Icons.search,
//                 color: Color(0xFF8A8A8A),
//                 size: 20,
//               ),
//             ),
//             Text(
//               'Search for news',
//               style: TextStyle(
//                   fontSize: 16,
//                   color: Color(0xFF8A8A8A),
//                   fontWeight: FontWeight.w300),
//             ),
//           ]),
//         ),
//       ),
//     );
//   }
// }
