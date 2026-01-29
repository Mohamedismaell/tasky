import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do_app/core/theme/extensions/theme_extension.dart';
import 'package:to_do_app/features/home/presentation/manager/user_validation/user_validation_cubit.dart';

class ImageProfileAvatar extends StatelessWidget {
  const ImageProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserValidationCubit, UserValidationState>(
      builder: (context, state) {
        return Stack(
          alignment: Alignment.bottomRight,
          children: [
            CircleAvatar(
              radius: 50.sp,
              backgroundColor: Colors.transparent,
              child: ClipOval(
                child: SvgPicture.asset('assets/images/work_progress.svg'),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: 34.w,
                height: 34.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: context.colorTheme.surface,
                ),
                child: Icon(Icons.camera_alt_outlined, size: 18.sp),
              ),
            ),
          ],
        );
      },
    );
  }
}
