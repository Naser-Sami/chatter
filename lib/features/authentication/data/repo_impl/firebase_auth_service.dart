import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '/core/_core.dart';
import '/config/_config.dart';
import '/features/authentication/domain/domain.dart';

class FirebaseAuthService implements IFirebaseAuthService {
  final _auth = sl<FirebaseAuth>();
  UserCredential? _userCredential;

  UserCredential? get userCredential => _userCredential;

  @override
  Future<void> signInWithPhoneNumber(String phoneNumber) async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: _verificationCompleted,
        verificationFailed: _verificationFailed,
        codeSent: _codeSent,
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      THelperFunctions.showToastBar(
        NavigationService.navigatorKey.currentContext!,
        color: Theme.of(NavigationService.navigatorKey.currentContext!).colorScheme.errorContainer,
        TextWidget(e.toString()),
      );
    }
  }

  Future<void> _verificationCompleted(PhoneAuthCredential credential) async {
    _auth.signInWithCredential(credential).then((value) async => _userCredential = value);
  }

  Future<void> _verificationFailed(FirebaseAuthException exception) async {
    final authException = TFirebaseAuthException(exception.code);

    THelperFunctions.showToastBar(
      NavigationService.navigatorKey.currentContext!,
      TextWidget(authException.message),
    );
  }

  void _codeSent(String verificationId, int? resendToken) async {
    try {
      // Update the UI - wait for the user to enter the SMS code
      String smsCode = 'xxxx';

      // Create a PhoneAuthCredential with the code
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );

      THelperFunctions.showToastBar(
        NavigationService.navigatorKey.currentContext!,
        const TextWidget("Code has been sent!"),
      );

      // Sign the user in (or link) with the credential
      await _auth.signInWithCredential(credential);
    } catch (e) {
      THelperFunctions.showToastBar(
        NavigationService.navigatorKey.currentContext!,
        color: Theme.of(NavigationService.navigatorKey.currentContext!).colorScheme.errorContainer,
        TextWidget(e.toString()),
      );
    }
  }
}
