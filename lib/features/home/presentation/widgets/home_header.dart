import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do_app/core/theme/extensions/theme_extension.dart';
import 'package:to_do_app/core/theme/manager/theme_cubit.dart';
import 'package:to_do_app/features/home/presentation/manager/user_validation/user_validation_cubit.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => context.pop(),
            child: CircleAvatar(
              radius: 20.r,
              child: ClipOval(
                child: SvgPicture.asset(
                  'assets/images/work_progress.svg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(width: 8.w),
          BlocBuilder<UserValidationCubit, UserValidationState>(
            builder: (context, state) {
              return Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Good Evening ,${state.userDetails.userName}',
                      style: context.textTheme.bodyLarge,
                    ),
                    Text(
                      // textAlign: TextAlign.center,
                      'One task at a time.One step closer.',
                      style: context.textTheme.bodyMedium,
                    ),
                  ],
                ),
              );
            },
          ),
          SizedBox(width: 8.w),
          BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              return Container(
                width: 34.w,
                height: 34.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: context.colorTheme.surface,
                ),
                child: IconButton(
                  onPressed: () => context.read<ThemeCubit>().toggleTheme(),
                  icon: Icon(
                    state.isLight
                        ? Icons.dark_mode_outlined
                        : Icons.light_mode_outlined,
                    size: 18.sp,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
