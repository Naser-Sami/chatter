import 'package:pinput/pinput.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '/core/_core.dart';
import '/config/_config.dart';
import '/features/_features.dart';

class PinputWidget extends StatefulWidget {
  const PinputWidget({super.key});

  @override
  State<PinputWidget> createState() => PinputWidgetState();
}

class PinputWidgetState extends State<PinputWidget> {
  late final TextEditingController _pinController;
  late final FocusNode _pinFocus;
  late final String verificationId;
  String? _otpCode;

  @override
  void initState() {
    super.initState();

    // get extra data from the GoRouter state
    getExtraData();

    // Initialize the TextEditingController and FocusNode
    _pinController = TextEditingController();
    _pinFocus = FocusNode();
  }

  // get extra data from the GoRouter state
  void getExtraData() {
    final goRouteState = GoRouterState.of(context).extra as Map<String, dynamic>;
    verificationId = goRouteState[Constants.verificationId];
  }

  void onCompleted(String pin) {
    setState(() {
      _otpCode = pin;
    });

    // verify otp code
    verifyOtpCode();
  }

  void verifyOtpCode() {
    if (_otpCode != null) {
      sl<IFirebaseAuthService>().verifyOtpCode(
        otpCode: _otpCode!,
        verificationId: verificationId,
      );
    }
  }

  // dispose the TextEditingController and FocusNode
  // when the widget is disposed
  @override
  void dispose() {
    super.dispose();
    _pinController.dispose();
    _pinFocus.dispose();
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
