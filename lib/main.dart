// import 'package:flutter/material.dart';

// import 'package:untitled/transformer.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const Mytransformer(),
//     );
//   }
// }

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

// class Mytransformer extends StatefulWidget {
//   const Mytransformer({super.key});

//   @override
//   State<Mytransformer> createState() => _MytransformerState();
// }

// class _MytransformerState extends State<Mytransformer> {
//   final TransformerPageController _controller =
//       TransformerPageController(itemCount: 10);
//   @override
//   Widget build(BuildContext context) {
//     return TransformerPageView(
//       onPageChanged: (value) {
//         print(value);
//       },
//       index: 0,
//       transformer: DeepthPageTransformer(),
//       pageController: _controller,
//       itemBuilder: (BuildContext context, int index) {
//         return Scaffold(
//           body: Container(
//             color: index % 2 == 0 ? Colors.amber : Colors.deepOrangeAccent,
//             child: Center(
//               child: Text('Page $index'),
//             ),
//           ),
//         );
//       },
//       itemCount: 10,
//     );
//   }
// }

// import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
//Pages
import 'package:provider/provider.dart';
import 'package:untitled/utilities/CheckWeb.dart';
import 'package:untitled/utilities/themeData.dart';

// import 'package:untitled/MainScreen/ChatsHistoryPage.dart';
import 'MainScreens/AuthPage.dart';
import 'MainScreens/BookMarkPage.dart';
import 'MainScreens/CategoriesPage.dart';
import 'MainScreens/ChatsHistoryPage.dart';
import 'MainScreens/FeedBackPage.dart';
import 'MainScreens/HelpPage.dart';
import 'MainScreens/NewsFeed.dart';
import 'MainScreens/SearchPage.dart';
import 'MainScreens/SettingPage.dart';
import 'MainScreens/TrendingPage.dart';
import 'MainScreens/UnseenStories.dart';
import 'Provider/AuthProvider.dart';
import 'Provider/ChatProvider.dart';
import 'Provider/NewsProvider.dart';
import 'Provider/UserProvider.dart';
import 'Provider/loaderProvider.dart';
// import 'Provider/NetworkStatus.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (PlatformUtils.isMobile || PlatformUtils.isDesktop) {
    await Firebase.initializeApp();
  } else {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyD_3A6XON_GkIK0rN9enl_95R7xdCiD3BQ",
        authDomain: "newsapp-b0b74.firebaseapp.com",
        projectId: "newsapp-b0b74",
        storageBucket: "newsapp-b0b74.appspot.com",
        messagingSenderId: "473742830038",
        appId: "1:473742830038:web:8a26e8ffabdecc7a759c77",
        measurementId: "G-WDT53W3T9E",
      ),
    );
  }
  // await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ChatProvider()),
        ChangeNotifierProvider<NewsProvider>(
            create: (context) => NewsProvider()),
        ChangeNotifierProvider<UserProvider>(
            create: (context) => UserProvider()),
        ChangeNotifierProvider<GoogleSignInProvider>(
            create: ((context) => GoogleSignInProvider())),
        ChangeNotifierProvider<LoadingProvider>(
            create: ((context) => LoadingProvider())),
      ],
      child: MaterialApp(
        title: 'News App',
        // builder: LoadingScreen.init(),
        theme: MyTheme.lightTheme(context),
        initialRoute: '/',
        routes: {
          '/': (context) => const MyHomePage(),
          '/auth': (context) => const LoginPage(),
          '/feed': (context) => const FeedPage(),
          '/bookmark': (context) => const BookmarkPage(),
          '/categories': (context) => const CategoriesPage(),
          '/chat': (context) => const ChatHistoryPage(),
          '/feedback': (context) => const FeedBackPage(),
          '/help': (context) => const HelpPage(),
          '/search': (context) => const SearchPage(),
          '/setting': (context) => const SettingPage(),
          '/trending': (context) => const TrendingPage(),
          '/unseenstories': (context) => const UnseenStoriesPage(),
        },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // return FeedPage();
    if (FirebaseAuth.instance.currentUser != null) {
      print('Feed Page');
      return const FeedPage();
    } else {
      print('Login');
      return const LoginPage();
    }
  }
}
