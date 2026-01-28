import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/core/theme/extensions/theme_extension.dart';

class Progerss extends StatelessWidget {
  const Progerss({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colorTheme.surface,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Row(
          children: [
            Column(children: [Text('Achieved Tasks'), Text('3 Out of 6 Done')]),
            Spacer(),
            CircularProgressIndicator(
              value: 0.4,
              semanticsValue: '40%',
              // valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
              backgroundColor: context.colorTheme.onSurface,
            ),
          ],
        ),
      ),
    );
  }
}
