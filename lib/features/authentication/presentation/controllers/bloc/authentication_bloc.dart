import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '/core/_core.dart';
import '/features/authentication/_authentication.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final IFirebaseAuthService firebaseAuthService = FirebaseAuthService();

  AuthenticationBloc() : super(LoginInitial()) {
    on<LoginButtonPressedEvent>(_onLoginButtonPressed);
    on<VerifyOtpCodeEvent>(_onVerifyOtpCode);
    on<OtpVerificationSuccessEvent>(_onSuccess);
  }

  void _onLoginButtonPressed(LoginButtonPressedEvent event, Emitter<AuthenticationState> emit) {
    emit(LoginLoading());
    try {
      firebaseAuthService.signInWithPhoneNumber(event.phoneNumber);
      emit(LoginSuccess());
    } catch (e) {
      emit(LoginFailure(error: e.toString()));
    }
  }

  Future<void> _onVerifyOtpCode(VerifyOtpCodeEvent event, Emitter<AuthenticationState> emit) async {
    emit(VerifyOtpCodeLoading());

    try {
      await firebaseAuthService.verifyOtpCode(
        otpCode: event.otpCode,
        verificationId: event.verificationId,
        onSuccess: () => add(const OtpVerificationSuccessEvent()),
      );
    } catch (e) {
      emit(VerifyOtpCodeFailure(error: e.toString()));
    }
  }

  Future<void> _onSuccess(OtpVerificationSuccessEvent event, Emitter<AuthenticationState> emit) async {
    emit(VerifyOtpCodeSuccess());

    // -> auth service
    final auth = sl<IFirebaseAuthService>();

    // Check if the user exist in the database
    final isUserExists = await auth.checkIfUserExist();

    // If the user exist, navigate to the home screen
    if (isUserExists) {
      // - Get user data from the firestore
      auth.userModel = await auth.getUserData();

      // - Save user data to the local storage
      auth.saveUserDataToLocalStorage();

      // navigate to the home scree
      emit(NavigateToHome());
    }

    // If the user does not exist, navigate to user information screen
    else {
      emit(NavigateToUserInformation());
    }
  }
}
