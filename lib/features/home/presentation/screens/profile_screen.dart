import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_app/core/injection/common_di.dart';
import 'package:to_do_app/core/theme/extensions/theme_extension.dart';
import 'package:to_do_app/core/theme/manager/theme_cubit.dart';
import 'package:to_do_app/features/home/presentation/screens/user_details_screen.dart';
import 'package:to_do_app/features/home/presentation/widgets/image_profile_avatar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String userName = cacheHelper.getData(key: 'username');

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.transparent,
        title: Align(
          alignment: AlignmentGeometry.centerLeft,
          child: Text('My Profile'),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ImageProfileAvatar(),
              SizedBox(height: 8.h),
              Text(userName, style: context.textTheme.titleLarge),
              SizedBox(height: 2.h),
              Text(
                'One task at a time. One step closer.',
                style: context.textTheme.bodyMedium,
              ),
              SizedBox(height: 24.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('My Tasks', style: context.textTheme.titleMedium),
              ),
              SizedBox(height: 20.h),
              _buildProfileItem(
                context,
                Icons.person_2_outlined,
                'User Details',
                true,
                false,
                false,
              ),
              SizedBox(height: 10.h),
              Divider(color: context.colorTheme.onPrimary),
              SizedBox(height: 10.h),
              _buildProfileItem(
                context,
                Icons.mode_night_outlined,
                'Dark Mode',
                false,
                true,
                false,
              ),
              SizedBox(height: 10.h),
              Divider(color: context.colorTheme.onPrimary),
              SizedBox(height: 10.h),
              _buildProfileItem(
                context,
                Icons.logout,
                'Log Out',
                false,
                false,
                true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildProfileItem(
  BuildContext context,
  IconData icon,
  String title,
  bool isDetails,
  bool isMode,
  bool isLogout,
) {
  return GestureDetector(
    onTap: () {
      if (isDetails) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const UserDetailsScreen()),
        );
      }
    },
    child: Row(
      children: [
        isDetails
            ? SvgPicture.asset(
                'assets/images/profile.svg',
                height: 20.sp,
                // width: 20.sp,
                colorFilter: ColorFilter.mode(
                  context.colorTheme.onPrimary,
                  BlendMode.srcIn,
                ),
              )
            : isMode
            ? Transform.rotate(angle: 2.5, child: Icon(icon, size: 24.sp))
            : Icon(icon, size: 24.sp),
        SizedBox(width: 16.w),
        Expanded(child: Text(title, style: context.textTheme.bodyLarge)),
        isMode
            ? BlocBuilder<ThemeCubit, ThemeState>(
                builder: (context, state) {
                  return Switch(
                    value: state.isDark,
                    onChanged: (value) {
                      context.read<ThemeCubit>().toggleTheme();
                    },
                  );
                },
              )
            : Icon(Icons.arrow_forward_ios, size: 24.sp),
      ],
    ),
  );
}
