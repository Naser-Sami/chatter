import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/features/_features.dart';
import 'cubit/bottom_navigation_bar_cubit.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBarCubit, int>(
      builder: (context, state) {
        return BottomNavigationBar(
          currentIndex: state,
          onTap: (index) {
            context.read<BottomNavigationBarCubit>().changeIndex(index);
            // Update the PageView to the tapped index
            context.findAncestorStateOfType<HomeScreenState>()?.animateToPage(index);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.chat_bubble_2),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.group),
              label: 'Group',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.globe),
              label: 'Global',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.settings_solid),
              label: 'Setting',
            ),
          ],
        );
      },
    );
  }
}
