import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:country_picker/country_picker.dart';

import '/config/_config.dart';
import '/core/_core.dart';

// Show Country Picker Bottom Sheet
void showCountryPickerBottomSheet(BuildContext context) => showCountryPicker(
      context: context,
      onSelect: context.read<CountryPickerCubit>().onSelect,
      showPhoneCode: true,
      countryListTheme: CountryListThemeData(
        flagSize: TSize.s24,
        padding: const EdgeInsets.all(TPadding.p24),
        textStyle: context.textTheme.bodyMedium?.copyWith(
          color: context.theme.colorScheme.onSurface,
          fontWeight: FontWeight.w500,
        ),
        backgroundColor: context.theme.colorScheme.surfaceContainerLow,
        bottomSheetHeight: MediaQuery.of(context).size.height * 0.70,
      ),
    );
