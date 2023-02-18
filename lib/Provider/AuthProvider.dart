// import 'dart:convert';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:news_app/Api_Services/api_call.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import '../Api_Services/login.dart';
// import '../Models/Auth.dart';
// import 'UserProvider.dart';

// class GoogleSignInProvider extends ChangeNotifier {
//   final googlesignin = GoogleSignIn();

//   GoogleSignInAccount? _user;

//   GoogleSignInAccount? get user => _user;

//   AuthCredential? _credential;

//   Future googleLogin(BuildContext context) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     googlesignin.signIn().then((googleuser) {
//       if (googleuser == null) return 'Try Again';
//       _user = googleuser;
//       print(_user);
//       googleuser.authentication.then((googleAuth) {
//         _credential = GoogleAuthProvider.credential(
//           accessToken: googleAuth.accessToken,
//           idToken: googleAuth.idToken,
//         );
//         FirebaseAuth.instance
//             .signInWithCredential(_credential!)
//             .then((value) => {
//                   prefs.setString(
//                       'User',
//                       jsonEncode({
//                         'displayname': value.user!.displayName,
//                         'email': value.user!.email,
//                         'id': value.user!.uid
//                       })),

//                   postUser(
//                     '/user/login/',
//                     LoginRequest(
//                       type: 'google',
//                       auth0: Auth0(
//                           name: value.user!.displayName,
//                           email: value.user!.email,
//                           id: value.user!.uid),
//                     ),
//                   )
//                       .then((value) => {
//                             print(value),
//                             //  Map<String, dynamic > user = {'Username':'tom','Password':'pass@123'},
//                             apicall.setToken(value),
//                             prefs.setBool('isLogin', true),
//                             Navigator.pushNamedAndRemoveUntil(
//                                 context, '/feed', (route) => false),
//                             // return 'Sign in Successfully',
//                           })
//                       .catchError(
//                           (onError) => {googleLogOut(context), print(onError)}),
//                   context.read<UserProvider>().setUser(
//                       value.user!.displayName.toString(),
//                       value.user!.email.toString(),
//                       value.user!.uid),
//                   // Api Call to save user in backend
//                 })
//             .catchError((onError) {
//           googleLogOut(context);
//           return onError;
//           //And ask to sign in again.
//         });
//       }).catchError((onError) {
//         googlesignin.signOut();
//         return 'Something went wrong';
//       });
//     }).catchError((onError) => print(onError));

//     // try {
//     //   print('Function called');
//     //   final googleuser = await googlesignin.signIn();
//     //   if (googleuser == null) {
//     //     print('ree');
//     //     return 'Try Again';
//     //   }

//     //   _user = googleuser;
//     //   print(_user);
//     //   final googleAuth = await googleuser.authentication;

//     //   _credential = GoogleAuthProvider.credential(
//     //     accessToken: googleAuth.accessToken,
//     //     idToken: googleAuth.idToken,
//     //   );
//     //   await FirebaseAuth.instance.signInWithCredential(_credential!);

//     //   final _pref = await SharedPreferences.getInstance();
//     //   _pref.setBool('isLogin', true);
//     //   Navigator.pushNamedAndRemoveUntil(context, '/feed', (route) => false);
//     //   return googleuser;
//     // } catch (error) {
//     //   const snackBar = SnackBar(
//     //     content: Text('Please Check Your Internet Connectivity!!'),
//     //   );
//     //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
//     // }

//     notifyListeners();
//   }

//   Future googleLogOut(BuildContext context) async {
//     SharedPreferences _pref = await SharedPreferences.getInstance();

//     // FirebaseAuth.instance.signOut().then((value) {
//     //   googlesignin
//     //       .signOut()
//     //       .then((value) => 'Sign Out Succesfully')
//     //       .catchError((onError) {
//     //     FirebaseAuth.instance.signInWithCredential(_credential!);
//     //     return 'Something went Wrong';
//     //   });
//     // }).catchError((onError) {
//     //   return onError;
//     // });

//     try {
//       await googlesignin.disconnect();
//       await FirebaseAuth.instance.signOut();
//       // final _pref = await SharedPreferences.getInstance();
//       _pref.setBool('isLogin', false);
//       _pref.clear();
//       Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
//     } catch (error) {
//       final snackBar = SnackBar(
//         content: Text(error.toString()),
//       );
//       ScaffoldMessenger.of(context).showSnackBar(snackBar);
//     }
//   }
// }
