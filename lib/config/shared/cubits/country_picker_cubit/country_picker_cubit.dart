import 'package:country_picker/country_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountryPickerCubit extends Cubit<Country> {
  CountryPickerCubit()
      : super(
          Country(
            phoneCode: '+970',
            countryCode: 'PS',
            e164Sc: 0,
            geographic: true,
            level: 1,
            name: 'Palestinian',
            example: '599123456',
            displayName: 'Palestinian (PS) [+970]',
            displayNameNoCountryCode: 'Palestinian (PS)',
            e164Key: '970-PS-0',
          ),
        );

  void onSelect(Country country) => emit(country);
}
