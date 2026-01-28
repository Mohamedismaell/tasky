import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_app/core/theme/app_colors.dart';
import 'package:to_do_app/core/theme/extensions/theme_extension.dart';
import 'package:to_do_app/core/theme/manager/theme_cubit.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final void Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, themeState) {
        return CurvedNavigationBar(
          index: currentIndex,
          backgroundColor: context.colorTheme.outline,
          color: themeState.isLight
              ? AppColors.backgroundLight
              : AppColors.backgroundDark,
          items: [
            _item(
              context,
              index: 0,
              icon: 'assets/images/home.svg',
              label: 'Home',
            ),
            _item(
              context,
              index: 1,
              icon: 'assets/images/todo.svg',
              label: 'To Do',
            ),
            _item(
              context,
              index: 2,
              icon: 'assets/images/completed.svg',
              label: 'Completed',
            ),
            _item(
              context,
              index: 3,
              icon: 'assets/images/profile.svg',
              label: 'Profile',
            ),
          ],
          onTap: onTap,
        );
      },
    );
  }

  CurvedNavigationBarItem _item(
    BuildContext context, {
    required int index,
    required String icon,
    required String label,
  }) {
    final isActive = currentIndex == index;

    return CurvedNavigationBarItem(
      child: SizedBox(
        width: 24.w,
        height: 24.h,
        child: SvgPicture.asset(
          icon,
          colorFilter: ColorFilter.mode(
            isActive ? context.colorTheme.primary : context.colorTheme.outline,
            BlendMode.srcIn,
          ),
        ),
      ),
      label: label,
      labelStyle: context.textTheme.bodySmall!.copyWith(
        fontSize: 14,
        color: isActive
            ? context.colorTheme.primary
            : context.colorTheme.outline,
      ),
    );
  }
}
