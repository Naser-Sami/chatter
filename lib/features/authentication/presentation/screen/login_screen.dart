import 'package:flutter/material.dart';

import '/core/_core.dart';
import '/config/_config.dart';
import '/features/_features.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const LoginScreenBody();
  }
}

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(TPadding.p48),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const LottieAssetWidget(
                  height: 200,
                  width: 200,
                  name: 'chat',
                ),
                TSize.s24.toHeight,
                TextWidget(
                  Constants.appName,
                  style: context.textTheme.displayMedium,
                ),
                TSize.s24.toHeight,
                TextWidget(
                  "Add your phone number we will send you a verification code.",
                  style: context.textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                TSize.s48.toHeight,
                const LoginFormsWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
