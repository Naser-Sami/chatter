import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/config/_config.dart';
import '/features/_features.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: context.read<BottomNavigationBarCubit>().state,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  // A helper method to animate to a specific page
  void animateToPage(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: PageView(
        controller: _pageController,
        onPageChanged: context.read<BottomNavigationBarCubit>().changeIndex,
        children: const [
          ChatScreen(),
          GroupScreen(),
          PeopleScreen(),
          SettingsScreen(),
        ],
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(),
    );
  }
}
