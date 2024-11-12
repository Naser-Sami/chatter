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

final class VerifyOtpCodeEvent extends AuthenticationEvent {
  final String otpCode;
  final String verificationId;

  const VerifyOtpCodeEvent({
    required this.otpCode,
    required this.verificationId,
  });

  @override
  List<Object> get props => [otpCode, verificationId];

  @override
  String toString() => 'VerifyOtpCode { otpCode: $otpCode, verificationId: $verificationId }';
}

final class OtpVerificationSuccessEvent extends AuthenticationEvent {
  const OtpVerificationSuccessEvent();
  @override
  List<Object> get props => [];
}
