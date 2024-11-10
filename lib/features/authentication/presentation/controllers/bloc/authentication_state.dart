part of 'authentication_bloc.dart';

sealed class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

final class LoginInitial extends AuthenticationState {}

final class LoginLoading extends AuthenticationState {}

final class LoginSuccess extends AuthenticationState {}

final class LoginFailure extends AuthenticationState {
  final String error;
  const LoginFailure({required this.error});

  @override
  List<Object> get props => [error];
}
