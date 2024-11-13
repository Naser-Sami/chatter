import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/core/_core.dart';
import '/config/_config.dart';
import '/features/_features.dart';

class FirebaseAuthService implements IFirebaseAuthService {
  // firebase auth and firestore instances
  final _auth = sl<FirebaseAuth>();
  final _firestore = sl<FirebaseFirestore>();

  // variables
  String _phoneNumber = '';
  UserCredential? _userCredential;
  UserCredential? get userCredential => _userCredential;

  @override
  UserModel userModel = UserModel.empty();

  // sign in with phone number
  @override
  Future<void> signInWithPhoneNumber(String phoneNumber) async {
    try {
      _phoneNumber = phoneNumber;

      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: _verificationCompleted,
        verificationFailed: _verificationFailed,
        codeSent: _codeSent,
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      throw Exception(e.toString());
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
    NavigationService.navigatorKey.currentContext!.go(
      Constants.routeOtpScreen,
      extra: {
        Constants.verificationId: verificationId,
        Constants.phoneNumber: _phoneNumber,
      },
    );
  }

  // verify otp code
  @override
  Future<void> verifyOtpCode({required String otpCode, required String verificationId, required Function onSuccess}) async {
    // Create a PhoneAuthCredential with the code
    final PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: otpCode,
    );

    // Sign the user in (or link) with the credential

    try {
      await _auth.signInWithCredential(credential);
      onSuccess();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // check if user exist in the database
  @override
  Future<bool> checkIfUserExist() async {
    final uid = _auth.currentUser?.uid;

    DocumentSnapshot snapshot = await _firestore.collection(Constants.firestoreCollectionUsers).doc(uid).get();

    return snapshot.exists;
  }

  // get user data
  @override
  Future<UserModel> getUserData() async {
    final uid = _auth.currentUser?.uid;

    final snapshot = await _firestore.collection(Constants.firestoreCollectionUsers).doc(uid).get();
    final userData = UserModel.fromMap(snapshot.data() as Map<String, dynamic>);
    log('user data: ${userData.toString()}');

    userModel = userData;
    return userModel;
  }

  // save user data to the local storage
  @override
  void saveUserDataToLocalStorage() {
    // save user data to the local storage using hive

    // hive storage
    final hiveStore = Hive.box(Constants.hiveBoxUser);
    hiveStore.put(Constants.hiveBoxUserKey, jsonEncode(userModel.toMap()));
  }

  // get user data from the local storage using hive
  @override
  UserModel getUserDataFromLocalStorage() {
    // hive storage
    final hiveStore = Hive.box(Constants.hiveBoxUser);
    final userData = hiveStore.get(Constants.hiveBoxUserKey);

    userModel = UserModel.fromMap(jsonDecode(userData));
    log('user data: ${userModel.toString()}');

    return userModel;
  }
}
