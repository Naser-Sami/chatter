// Packages
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:country_picker/country_picker.dart';
import 'package:url_launcher/url_launcher_string.dart';

// Files
import '/core/_core.dart';
import '/config/_config.dart';

class TFunctions {
  TFunctions._();

  // Is Dark Mode
  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  // URL Launcher
  static void launchUrl(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  // FOR SVG ICONS
  static String getIconSVG(String name) {
    try {
      return '${Constants.pathSystemIcons}$name.svg';
    } catch (e) {
      return '';
    }
  }

  // FOR PNG IMAGES
  static String getPngImage(String name) {
    try {
      return '${Constants.pathImages}$name.png';
    } catch (e) {
      return '';
    }
  }

  // Get Last 4 Digits in a String
  static String? returnLastNDigits(String? text, int? digits) {
    try {
      if (text == null) {
        return '';
      } else if (digits == null) {
        return '';
      } else {
        return text.substring(text.length - digits);
      }
    } catch (e) {
      return '';
    }
  }

  // Show Country Picker Bottom Sheet
  static void showCountryPickerBottomSheet(BuildContext context) => showCountryPicker(
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
}
