import 'package:flutter/material.dart';
// import 'package:news_app/Provider/UserProvider.dart';
import 'package:provider/provider.dart';

import '../Provider/AuthProvider.dart';
import '../Provider/loaderProvider.dart';
import '../Widgets/AuthButton.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'images/Ask-Us.png',
              width: 263,
              height: 263,
            ),
            Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                AuthButton(
                    buttonText: 'Contiune With Google',
                    buttonColor: Colors.white,
                    textColor: Colors.black,
                    onPressed: () async {
                      final loader = context.read<LoadingProvider>();
                      final googleProvider =
                          context.read<GoogleSignInProvider>();

                      loader.setLoad(true);
                      final data = await googleProvider
                          .googleLogin(context)
                          .then((value) =>
                              {print('value'), loader.setLoad(false)});
                    },
                    buttonImage: 'images/google-logo.png'),
                const SizedBox(
                  height: 20,
                ),
                // AuthButton(
                //     buttonText: 'Contiune With Apple',
                //     buttonColor: Colors.black,
                //     textColor: Colors.white,
                //     onPressed: () async {
                //       final provider = Provider.of<GoogleSignInProvider>(
                //           context,
                //           listen: false);
                //       provider.googleLogin(context);
                //     },
                //     buttonImage: 'images/apple-logo.png'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
