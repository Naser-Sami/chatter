import 'package:flutter/material.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';

import '/core/_core.dart';
import '/config/_config.dart';

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
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundColor: context.theme.colorScheme.surfaceContainer,
                      child: const Icon(
                        Icons.person,
                        size: 60,
                      ),
                    ),
                    Positioned(
                      bottom: -5,
                      right: -5,
                      child: IconButton(
                        onPressed: () {},
                        padding: EdgeInsets.zero,
                        icon: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: context.theme.colorScheme.onPrimaryContainer,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.camera_alt,
                            size: 18,
                            color: context.theme.colorScheme.onPrimary,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
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
