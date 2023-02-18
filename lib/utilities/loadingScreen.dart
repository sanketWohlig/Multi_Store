// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../Provider/loaderProvider.dart';

// class LoadingScreen {
//   static TransitionBuilder init({
//     TransitionBuilder? builder,
//   }) {
//     return (BuildContext context, Widget? child) {
//       if (builder != null) {
//         return builder(context, LoadingCustom(child: child!));
//       } else {
//         return LoadingCustom(child: child!);
//       }
//     };
//   }
// }

// class LoadingCustom extends StatelessWidget {
//   final Widget child;

//   const LoadingCustom({super.key, required this.child});

//   @override
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: ChangeNotifierProvider<LoadingProvider>(
//             create: (context) => LoadingProvider(),
//             builder: (context, _) {
//               return Stack(children: [
//                 child,
//                 Consumer<LoadingProvider>(builder: (context, provider, child) {
//                   return provider.loading
//                       ? const Center(child: CircularProgressIndicator())
//                       : Container();
//                 })
//               ]);
//             }));
//   }
// }
