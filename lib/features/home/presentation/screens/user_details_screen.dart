import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do_app/core/theme/extensions/theme_extension.dart';
import 'package:to_do_app/core/widget/custom_text_form_field.dart';
import 'package:to_do_app/features/home/presentation/manager/user_validation/user_validation_cubit.dart';

class UserDetailsScreen extends StatelessWidget {
  const UserDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserValidationCubit, UserValidationState>(
      builder: (context, state) {
        String? userNameError;
        String? quoteError;
        final userValidationCubit = context.read<UserValidationCubit>();
        if (state is UserValidationFailure) {
          userNameError = state.userNameError;
          quoteError = state.motivationQuoteError;
        }
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
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('User Name', style: context.textTheme.titleMedium),
                  SizedBox(height: 8.h),
                  CustomTextFormField(
                    hinttext: 'Mohamed Ismael',
                    errorMessage: userNameError,
                    onChanged: userValidationCubit.updateUserName,
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    'Motivation Quote',
                    style: context.textTheme.titleMedium,
                  ),
                  SizedBox(height: 8.h),
                  Expanded(
                    child: CustomTextFormField(
                      hinttext: 'One task at a time. One step closer',
                      errorMessage: quoteError,
                      onChanged: userValidationCubit.updateMotivationQuote,
                      maxLines: 4,
                    ),
                  ),
                  _buildSaveButton(context),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

Widget _buildSaveButton(BuildContext context) {
  return BlocListener<UserValidationCubit, UserValidationState>(
    listener: (context, state) {
      if (state is UserValidationSuccess) {
        context.pop();
        context.read<UserValidationCubit>().reset();
      }
    },
    child: SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () =>
            context.read<UserValidationCubit>().submitUserDetails(),
        child: Text('Save Changes'),
      ),
    ),
  );
}
