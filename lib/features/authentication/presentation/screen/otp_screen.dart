import 'package:pinput/pinput.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/core/_core.dart';
import '/config/_config.dart';
import '/features/_features.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  'We have sent the a 6 digits code verification to your phone number ${context.read<LoginCubit>().state.phoneNumber}',
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.center,
                ),
              ),
              TSize.s48.toHeight,
              const PinputWidget(),
              TSize.s48.toHeight,
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

class PinputWidget extends StatefulWidget {
  const PinputWidget({super.key});

  @override
  State<PinputWidget> createState() => PinputWidgetState();
}

class PinputWidgetState extends State<PinputWidget> {
  late final TextEditingController _pinController;
  late final FocusNode _pinFocus;
  String? _otpCode;

  @override
  void initState() {
    super.initState();
    _pinController = TextEditingController();
    _pinFocus = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    _pinController.dispose();
    _pinFocus.dispose();
  }

  void onCompleted(String pin) {
    setState(() {
      _otpCode = pin;
    });

    // verify otp code
  }

  @override
  Widget build(BuildContext context) {
    return Pinput(
      length: 6,
      focusNode: _pinFocus,
      controller: _pinController,
      onCompleted: onCompleted,
      defaultPinTheme: defaultPinTheme(context),
      focusedPinTheme: focusedPinTheme(context),
      submittedPinTheme: submittedPinTheme(context),
      errorPinTheme: errorPinTheme(context),
    );
  }

  PinTheme? defaultPinTheme(BuildContext context) => PinTheme(
        width: 60,
        height: 60,
        textStyle: Theme.of(context).textTheme.titleLarge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(TPadding.p12),
          border: Border.all(color: Theme.of(context).colorScheme.primary),
        ),
      );

  PinTheme? focusedPinTheme(BuildContext context) => PinTheme(
        width: 60,
        height: 60,
        textStyle: Theme.of(context).textTheme.titleLarge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(TPadding.p12),
          border: Border.all(color: Theme.of(context).colorScheme.primary),
        ),
      );

  PinTheme? submittedPinTheme(BuildContext context) => PinTheme(
        width: 60,
        height: 60,
        textStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Theme.of(context).colorScheme.tertiary,
              fontWeight: FontWeight.w900,
            ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(TPadding.p12),
          border: Border.all(color: Theme.of(context).colorScheme.tertiary),
        ),
      );

  PinTheme? errorPinTheme(BuildContext context) => PinTheme(
        width: 60,
        height: 60,
        textStyle: Theme.of(context).textTheme.titleLarge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(TPadding.p12),
          border: Border.all(color: Theme.of(context).colorScheme.error),
        ),
      );
}
