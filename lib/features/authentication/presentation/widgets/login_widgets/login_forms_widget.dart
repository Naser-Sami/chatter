import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:country_picker/country_picker.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';

import '/core/_core.dart';
import '/config/_config.dart';
import '/features/authentication/_authentication.dart';

class LoginFormsWidget extends StatefulWidget {
  const LoginFormsWidget({super.key});

  @override
  State<LoginFormsWidget> createState() => _LoginFormsWidgetState();
}

class _LoginFormsWidgetState extends State<LoginFormsWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController _phoneNumberController;
  late final RoundedLoadingButtonController _btnController;
  String phoneCode = '';

  @override
  void initState() {
    super.initState();
    _phoneNumberController = TextEditingController();
    _btnController = RoundedLoadingButtonController();
  }

  @override
  void dispose() {
    super.dispose();
    _phoneNumberController.dispose();
    _btnController.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: TextFormField(
        controller: _phoneNumberController,
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.done,
        onChanged: context.read<LoginCubit>().phoneNumberChanged,
        validator: TValidator.validatePhoneNumber,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(
            RegExp(r'[0-9]'),
          ),
        ],
        decoration: InputDecoration(
          counterText: '',
          hintText: 'Phone Number',
          hintStyle: context.textTheme.labelLarge,
          prefixIcon: Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            width: TSize.s48 * 1.65,
            child: InkWell(
              onTap: () => TFunctions.showCountryPickerBottomSheet(context),
              child: BlocBuilder<CountryPickerCubit, Country>(
                builder: (context, state) {
                  phoneCode = state.phoneCode;

                  return TextWidget(
                    "${state.flagEmoji} ${state.phoneCode}",
                    style: context.textTheme.labelLarge?.apply(
                      color: context.theme.colorScheme.onSurface,
                    ),
                  );
                },
              ),
            ),
          ),
          suffixIcon: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              bool? isPhoneValid = context.watch<LoginCubit>().state.isPhoneValid;

              if (isPhoneValid == null || isPhoneValid == false) {
                return const SizedBox.shrink();
              }

              if (state is LoginFailure) {
                return IconButton(
                  onPressed: () {
                    _btnController.error();
                    _formKey.currentState?.validate();
                  },
                  icon: const Icon(
                    Icons.refresh,
                    color: Colors.red,
                  ),
                );
              }

              if (state is LoginLoading) {
                return const SizedBox(
                  width: TSize.s48,
                  height: TSize.s48,
                  child: CircularProgressIndicator(),
                );
              }

              return IconButton(
                onPressed: () {
                  // phone number
                  final phoneNumber = '+$phoneCode${_phoneNumberController.text}';
                  context.read<LoginCubit>().setPhoneNumber(phoneNumber);

                  // Sing in with phone number
                  context.read<AuthenticationBloc>().add(
                        LoginButtonPressedEvent(
                          phoneNumber: phoneNumber,
                        ),
                      );
                },
                icon: const CircleAvatar(
                  radius: 14,
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  child: Icon(
                    Icons.check,
                    size: 18,
                  ),
                ),
              );
            },
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(TRadius.bR08),
          ),
        ),
      ),
    );
  }
}
