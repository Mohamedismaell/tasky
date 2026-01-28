import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/core/navigaiton/custom_nav_bar.dart';
import 'package:to_do_app/features/home/presentation/screens/complete_screen.dart';
import 'package:to_do_app/features/home/presentation/screens/home_screen.dart';
import 'package:to_do_app/features/home/presentation/screens/profile_screen.dart';
import 'package:to_do_app/features/home/presentation/screens/todo_screen.dart';

class TabsShell extends StatefulWidget {
  const TabsShell({super.key});

  @override
  State<TabsShell> createState() => _TabsShellState();
}

class _TabsShellState extends State<TabsShell> {
  final pageController = PageController();
  int _currentIndex = 0;

  void _onTabTap(int index) {
    if (!pageController.hasClients) return;
    final current = pageController.page?.round() ?? _currentIndex;
    final distance = (index - current).abs();

    if (distance >= 1) {
      int neighbor = index > _currentIndex ? index - 1 : index + 1;
      pageController.jumpToPage(neighbor);
    }
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.amberAccent,
      // extendBody: true,
      extendBody: true,
      bottomNavigationBar: CustomNavBar(onTap: (index) => _onTabTap(index)),

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.w),
          child: PageView(
            controller: pageController,
            onPageChanged: (index) {
              if (mounted) {
                setState(() {
                  _currentIndex = index;
                });
              }
            },
            children: [
              const HomeScreen(),
              const TodoScreen(),
              const CompletedScreen(),
              const ProfileScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
