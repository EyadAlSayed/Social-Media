import 'package:flutter/material.dart';
import 'package:social_media/core/resource/app_color.dart';
import 'package:social_media/core/resource/app_icon.dart';
import 'package:social_media/core/resource/app_size.dart';
import 'package:social_media/feature/main/presentation/view/compass_view.dart';
import 'package:social_media/feature/main/presentation/view/home_view.dart';
import 'package:social_media/feature/main/presentation/view/profile_view.dart';
import 'package:social_media/feature/main/presentation/widget/bottom_nav_bar_icon.dart';

/**
 * Created by Eng.Eyad AlSayed on 10/7/2024.
 */

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Widget> screens = const [HomeView(), CompassView(), ProfileView()];

  int _selectedScreenIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.darkBlue,
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 800),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(opacity: animation, child: child);
        },
        child: screens[_selectedScreenIndex],
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppRadius.r20),
            topRight: Radius.circular(AppRadius.r20)),
        child: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: BottomNavBarIcon(
                  selectedIndex: _selectedScreenIndex,
                  itemIndex: 0,
                  icon: AppIcon.home),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: BottomNavBarIcon(
                  selectedIndex: _selectedScreenIndex,
                  itemIndex: 1,
                  icon: AppIcon.compass),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: BottomNavBarIcon(
                  selectedIndex: _selectedScreenIndex,
                  itemIndex: 2,
                  icon: AppIcon.profile),
              label: '',
            ),
          ],
          showSelectedLabels: false,
          // Hide label for selected item
          showUnselectedLabels: false,
          // Hide label for unselected items
          currentIndex: _selectedScreenIndex,
          selectedItemColor: AppColor.darkBlue,
          onTap: (newIndex) {
            if (_selectedScreenIndex == newIndex) return;
            setState(() {
              _selectedScreenIndex = newIndex;
            });
          },
        ),
      ),
    );
  }
}
