import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '/features/authentication/_authentication.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final IFirebaseAuthService firebaseAuthService = FirebaseAuthService();

  AuthenticationBloc() : super(LoginInitial()) {
    on<LoginButtonPressedEvent>(_onLoginButtonPressed);
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
}
