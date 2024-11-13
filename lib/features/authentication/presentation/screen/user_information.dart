import 'package:flutter/material.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';

import '/core/_core.dart';
import '/config/_config.dart';
import '/features/_features.dart';

class UserInformationScreen extends StatefulWidget {
  const UserInformationScreen({super.key});

  @override
  State<UserInformationScreen> createState() => _UserInformationScreenState();
}

class _UserInformationScreenState extends State<UserInformationScreen> {
  late final RoundedLoadingButtonController _buttonController;
  late final TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _buttonController = RoundedLoadingButtonController();
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _buttonController.reset();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: BackArrowWidget(
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'User Information',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(TPadding.p24),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TSize.s48.toHeight,
                const ProfileImagePickerWidget(),
                TSize.s96.toHeight,
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    hintText: 'Name',
                    hintStyle: context.textTheme.labelLarge,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(TRadius.bR08),
                    ),
                  ),
                ),
                TSize.s48.toHeight,
                RoundedLoadingButton(
                  controller: _buttonController,
                  successIcon: Icons.check,
                  successColor: Colors.green,
                  errorColor: Colors.red,
                  color: context.theme.colorScheme.primary,
                  onPressed: () {
                    // TODO: Save user information
                    // _buttonController.success();
                  },
                  child: TextWidget(
                    'Continue',
                    style: context.textTheme.titleMedium?.copyWith(
                      color: context.theme.colorScheme.onPrimary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
