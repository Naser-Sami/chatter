part of 'authentication_bloc.dart';

sealed class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

final class LoginButtonPressedEvent extends AuthenticationEvent {
  final String phoneNumber;
  const LoginButtonPressedEvent({required this.phoneNumber});

  @override
  List<Object> get props => [phoneNumber];

  @override
  String toString() => 'LoginButtonPressed { phoneNumber: $phoneNumber }';
}
