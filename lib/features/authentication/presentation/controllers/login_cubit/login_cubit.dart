import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '/core/_core.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit()
      : super(
          const LoginState(
            phoneNumber: '+962795900291',
            isPhoneValid: null,
          ),
        );

  void setPhoneNumber(String? phoneNumber) {
    emit(state.copyWith(phoneNumber: phoneNumber));
  }

  void phoneNumberChanged(String? phoneNumber) {
    bool? isValid;
    isValid = TValidator.validatePhoneNumber(phoneNumber) == null;

    emit(state.copyWith(isPhoneValid: isValid));
  }
}
