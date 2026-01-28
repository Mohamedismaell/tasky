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
  const CustomNavBar({super.key, required this.onTap});
  final void Function(int) onTap;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, themeState) {
        print('look $themeState');
        return CurvedNavigationBar(
          // height: 80.h,
          backgroundColor: context.colorTheme.outline,
          color: themeState.isLight
              ? AppColors.backgroundLight
              : AppColors.backgroundDark,
          items: [
            CurvedNavigationBarItem(
              child: SizedBox(
                width: 24.w,
                height: 24.h,
                child: SvgPicture.asset(
                  'assets/images/home.svg',
                  colorFilter: ColorFilter.mode(
                    context.colorTheme.primary,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              label: 'Home',
              labelStyle: context.textTheme.bodySmall!.copyWith(fontSize: 14),
            ),
            CurvedNavigationBarItem(
              child: SizedBox(
                width: 24.w,
                height: 24.h,
                child: SvgPicture.asset(
                  'assets/images/todo.svg',

                  colorFilter: ColorFilter.mode(
                    context.colorTheme.primary,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              label: 'To Do',
              labelStyle: context.textTheme.bodySmall!.copyWith(fontSize: 14),
            ),
            CurvedNavigationBarItem(
              child: SizedBox(
                width: 24.w,
                height: 24.h,
                child: SvgPicture.asset(
                  'assets/images/completed.svg',

                  colorFilter: ColorFilter.mode(
                    context.colorTheme.primary,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              label: 'Completed',
              labelStyle: context.textTheme.bodySmall!.copyWith(fontSize: 14),
            ),
            CurvedNavigationBarItem(
              child: SizedBox(
                width: 24.w,
                height: 24.h,
                child: SvgPicture.asset(
                  'assets/images/profile.svg',

                  colorFilter: ColorFilter.mode(
                    context.colorTheme.primary,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              label: 'Profile',
              labelStyle: context.textTheme.bodySmall!.copyWith(fontSize: 14),
            ),
          ],
          onTap: onTap,
        );
      },
    );
  }
}
// CurvedNavigationBar(
//           backgroundColor: context.colorTheme.outline,
//           color: themeState.isLight
//               ? AppColors.backgroundLight
//               : AppColors.backgroundDark,
//           items: <Widget>[
//             SizedBox(
//               width: 24.w,
//               height: 24.h,
//               child: SvgPicture.asset(
//                 'assets/images/home.svg',

//                 colorFilter: ColorFilter.mode(
//                   context.colorTheme.primary,
//                   BlendMode.srcIn,
//                 ),
//               ),
//             ),
//             SizedBox(
//               width: 24.w,
//               height: 24.h,
//               child: SvgPicture.asset(
//                 'assets/images/todo.svg',

//                 colorFilter: ColorFilter.mode(
//                   context.colorTheme.primary,
//                   BlendMode.srcIn,
//                 ),
//               ),
//             ),
//             SizedBox(
//               width: 24.w,
//               height: 24.h,
//               child: SvgPicture.asset(
//                 'assets/images/completed.svg',

//                 colorFilter: ColorFilter.mode(
//                   context.colorTheme.primary,
//                   BlendMode.srcIn,
//                 ),
//               ),
//             ),

//             SizedBox(
//               width: 24.w,
//               height: 24.h,
//               child: SvgPicture.asset(
//                 'assets/images/profile.svg',

//                 colorFilter: ColorFilter.mode(
//                   context.colorTheme.primary,
//                   BlendMode.srcIn,
//                 ),
//               ),
//             ),
//           ],
//           onTap: onTap,
//         );
