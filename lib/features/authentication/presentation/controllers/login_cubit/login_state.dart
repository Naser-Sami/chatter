part of 'login_cubit.dart';

class LoginState extends Equatable {
  const LoginState({required this.isPhoneValid});

  final bool? isPhoneValid;

  LoginState copyWith({
    bool? isPhoneValid,
  }) {
    return LoginState(
      isPhoneValid: isPhoneValid ?? this.isPhoneValid,
    );
  }

  @override
  List<Object?> get props => [isPhoneValid];
}
