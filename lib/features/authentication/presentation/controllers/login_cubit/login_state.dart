part of 'login_cubit.dart';

class LoginState extends Equatable {
  const LoginState({required this.phoneNumber, required this.isPhoneValid});

  final String phoneNumber;
  final bool? isPhoneValid;

  LoginState copyWith({
    String? phoneNumber,
    bool? isPhoneValid,
  }) {
    return LoginState(
      phoneNumber: phoneNumber ?? this.phoneNumber,
      isPhoneValid: isPhoneValid ?? this.isPhoneValid,
    );
  }

  @override
  List<Object?> get props => [phoneNumber, isPhoneValid];
}
