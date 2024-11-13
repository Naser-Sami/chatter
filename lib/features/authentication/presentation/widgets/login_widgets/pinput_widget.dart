import 'package:pinput/pinput.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  String verificationId = '';
  String? _otpCode;

  @override
  void initState() {
    super.initState();
    _pinController = TextEditingController();
    _pinFocus = FocusNode();
  }

  void getExtraData() {
    final goRouteState = GoRouterState.of(context).extra as Map<String, dynamic>;
    verificationId = goRouteState[Constants.verificationId];
  }

  void onCompleted(String pin) {
    setState(() {
      _otpCode = pin;
    });
    verifyOtpCode();
  }

  void verifyOtpCode() {
    getExtraData();
    if (_otpCode != null) {
      final bloc = context.read<AuthenticationBloc>();

      bloc.add(
        VerifyOtpCodeEvent(
          otpCode: _otpCode!,
          verificationId: verificationId,
        ),
      );
    }
  }

  @override
  void dispose() {
    _pinController.dispose();
    _pinFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is NavigateToHome) {
          context.go(Constants.routeHome);
        } else if (state is NavigateToUserInformation) {
          context.go(Constants.routeUserInformationScreen);
        } else if (state is VerifyOtpCodeFailure) {
          THelperFunctions.showToastBar(
            context,
            color: Theme.of(context).colorScheme.errorContainer,
            TextWidget(state.error),
          );
        }
      },
      child: Column(
        children: [
          Pinput(
            length: 6,
            focusNode: _pinFocus,
            controller: _pinController,
            onCompleted: onCompleted,
            defaultPinTheme: defaultPinTheme(context),
            focusedPinTheme: focusedPinTheme(context),
            submittedPinTheme: submittedPinTheme(context),
            errorPinTheme: errorPinTheme(context),
          ),
          TSize.s48.toHeight,
          BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              switch (state) {
                case VerifyOtpCodeLoading():
                  return const CircularProgressIndicator();
                case VerifyOtpCodeSuccess():
                  return const TextWidget(
                    'OTP Verification Successful',
                    style: TextStyle(color: Colors.green),
                  );
                case VerifyOtpCodeFailure():
                  return const TextWidget('Verification failed');
                default:
                  return const SizedBox.shrink();
              }
            },
          ),
        ],
      ),
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
