import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_app/core/injection/common_di.dart';
import 'package:to_do_app/core/theme/extensions/theme_extension.dart';

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
              CircleAvatar(
                radius: 85,
                backgroundColor: Colors.transparent,
                child: ClipOval(
                  child: SvgPicture.asset('assets/images/work_progress.svg'),
                ),
              ),
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
                false,
              ),
              SizedBox(height: 20.h),
              _buildProfileItem(
                context,
                Icons.mode_night_outlined,
                'Dark Mode',
                true,
              ),
              SizedBox(height: 20.h),
              _buildProfileItem(context, Icons.logout, 'Log Out', false),
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
  bool isMode,
) {
  return Row(
    children: [
      Icon(icon, size: 24.sp),
      SizedBox(width: 16.w),
      Expanded(child: Text(title, style: context.textTheme.bodyLarge)),
      isMode
          ? Switch(value: false, onChanged: (value) {})
          : Icon(Icons.arrow_forward_ios, size: 24.sp),
    ],
  );
}
