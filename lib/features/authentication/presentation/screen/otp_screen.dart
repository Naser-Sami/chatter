import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '/core/_core.dart';
import '/config/_config.dart';
import '/features/_features.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the extra data from the GoRouter state
    final goRouteState = GoRouterState.of(context).extra as Map<String, dynamic>;

    // Extract the phoneNumber from the extra data
    final phoneNumber = goRouteState[Constants.phoneNumber];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(TPadding.p24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'OTP Verification',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              TSize.s48.toHeight,
              Center(
                child: Text(
                  'We have sent the a 6 digits code verification to your phone number $phoneNumber',
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.center,
                ),
              ),
              TSize.s48.toHeight,
              const PinputWidget(),
              TSize.s48.toHeight,

              // Resend Code
              TextWidget(
                "Did not receive the code?",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              TextButton(
                onPressed: () {},
                child: TextWidget(
                  "Resend Code",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: context.theme.colorScheme.tertiary,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
