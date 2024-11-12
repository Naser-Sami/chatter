part of 'authentication_bloc.dart';

sealed class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

// Login

final class LoginInitial extends AuthenticationState {}

final class LoginLoading extends AuthenticationState {}

final class LoginSuccess extends AuthenticationState {}

final class LoginFailure extends AuthenticationState {
  final String error;
  const LoginFailure({required this.error});

  @override
  List<Object> get props => [error];
}

// Verify OTP

final class VerifyOtpCodeLoading extends AuthenticationState {}

final class VerifyOtpCodeSuccess extends AuthenticationState {}

final class VerifyOtpCodeFailure extends AuthenticationState {
  final String error;
  const VerifyOtpCodeFailure({required this.error});

  @override
  List<Object> get props => [error];
}

// Navigate
final class NavigateToHome extends AuthenticationState {}

final class NavigateToUserInformation extends AuthenticationState {}
