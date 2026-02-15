import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:to_do_app/core/enums/image_options.dart';
import 'package:to_do_app/core/theme/extensions/theme_extension.dart';
import 'package:to_do_app/features/home/presentation/manager/user_validation/user_validation_cubit.dart';

class ImageProfileAvatar extends StatelessWidget {
  const ImageProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserValidationCubit, UserValidationState>(
      builder: (context, state) {
        return Column(
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                SizedBox(
                  // width: 85.w,
                  // height: 85.h,
                  child: CircleAvatar(
                    radius: 50.sp,
                    backgroundColor: Colors.transparent,
                    backgroundImage: state.userDetails.imagePath != null
                        ? FileImage(File(state.userDetails.imagePath!))
                        : AssetImage('assets/images/profile_creat.png'),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    pickImage(context);
                  },
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
            ),
            SizedBox(height: 8.h),
            Text(
              state.userDetails.userName,
              style: context.textTheme.titleLarge,
            ),
            SizedBox(height: 2.h),
            Text(
              state.userDetails.motivationQuote,
              style: context.textTheme.bodyMedium,
            ),
          ],
        );
      },
    );
  }
}

void pickImage(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return SimpleDialog(
        // insetPadding: EdgeInsets.symmetric(vertical: 16.w),
        contentPadding: EdgeInsets.symmetric(vertical: 16.h),
        // title: Text('Pick Image'),
        children: [
          SimpleDialogOption(
            onPressed: () async {
              final image = await pickPhoto(ImageOptions.camera);
              print(' image?.path == > ${image?.path}');
              context.read<UserValidationCubit>().updateImagePath(image?.path);
              Navigator.pop(context);
            },
            child: Row(
              children: [
                Icon(Icons.camera_alt_outlined, size: 24.sp),
                SizedBox(width: 8.w),
                Text('Camera', style: context.textTheme.bodyLarge),
              ],
            ),
          ),
          SimpleDialogOption(
            onPressed: () async {
              final image = await pickPhoto(ImageOptions.gallery);
              print(' image?.path == > ${image?.path}');
              context.read<UserValidationCubit>().updateImagePath(image?.path);
              Navigator.pop(context);
            },
            child: Row(
              children: [
                Icon(Icons.image_outlined, size: 24.sp),
                SizedBox(width: 8.w),
                Text('Gallery', style: context.textTheme.bodyLarge),
              ],
            ),
          ),
        ],
      );
    },
  );
}

Future<File?> pickPhoto(ImageOptions imageOptions) async {
  switch (imageOptions) {
    case ImageOptions.camera:
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image != null) {
        final savedImage = await saveImage(image);
        return savedImage;
      }
    case ImageOptions.gallery:
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image != null) {
        final savedImage = await saveImage(image);
        return savedImage;
      }
  }
  return null;
}

//!  await image.saveTo(imagePath);
//*can do same job i think rather than ""File(image.path).copy(newPath)""
saveImage(XFile image) async {
  final dir = await getApplicationDocumentsDirectory();
  final newFile = await File(image.path).copy('${dir.path}/${image.name}');
  return newFile;
  // await CacheHelper().saveData(key: 'image', value: path);
}
