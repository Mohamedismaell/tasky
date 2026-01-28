import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/core/theme/extensions/theme_extension.dart';

Widget cardContainer({required BuildContext context, required Widget child}) {
  // print(
  //   ' MediaQuery.sizeOf(context).width ${MediaQuery.sizeOf(context).width}',
  // );
  return Container(
    width: MediaQuery.sizeOf(context).width,
    decoration: BoxDecoration(
      color: context.colorTheme.surface,
      borderRadius: BorderRadius.circular(20.r),
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: child,
    ),
  );
}
