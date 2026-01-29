import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do_app/core/injection/common_di.dart';
import 'package:to_do_app/core/routes/app_routes.dart';
import 'package:to_do_app/core/theme/extensions/theme_extension.dart';
import 'package:to_do_app/core/theme/manager/theme_cubit.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // final bool isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.r),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                // physics: isKeyboardOpen
                //     ? const ClampingScrollPhysics()
                //     : const NeverScrollableScrollPhysics(),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                    // MediaQuery.sizeOf(context).height -
                    // MediaQuery.of(context).padding.top -
                    // MediaQuery.of(context).padding.bottom -
                    // MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: IntrinsicHeight(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _buildHeader(context),
                        Spacer(),
                        _buildBody(context),
                        Spacer(),
                        SvgPicture.asset(
                          'assets/images/work_progress.svg',
                          width: 215.w,
                          height: 204.h,
                        ),
                        Spacer(),
                        _UserForm(),
                        SizedBox(height: 16.h),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => context.read<ThemeCubit>().toggleTheme(),
          child: SvgPicture.asset(
            'assets/images/logo.svg',
            width: 42.w,
            height: 42.h,
          ),
        ),
        SizedBox(width: 16.w),
        Text('Tasky', style: context.textTheme.titleLarge),
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.center,
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome To Tasky ', style: context.textTheme.titleLarge),
            SvgPicture.asset(
              'assets/images/waving_hand.svg',
              width: 28.w,
              height: 28.h,
            ),
          ],
        ),
        SizedBox(height: 8.h),
        Text(
          textAlign: TextAlign.center,
          'Your productivity journey starts here. ',
          style: context.textTheme.bodyLarge,
        ),
      ],
    );
  }
}

class _UserForm extends StatefulWidget {
  const _UserForm();

  @override
  State<_UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<_UserForm> {
  String? nameErrorText;
  bool validate = false;
  late TextEditingController nameController;
  @override
  void initState() {
    nameController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  void _validateUserName() {
    setState(() {
      if (nameController.text.isEmpty) {
        nameErrorText = 'Please enter your name';
        validate = false;
      } else if (nameController.text.length < 3) {
        nameErrorText = 'Name must be at least 3 characters long';
        validate = false;
      } else {
        nameErrorText = null;
        validate = true;
        print("Success! Data is: ${nameController.text}");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Full Name', style: context.textTheme.bodyLarge),
        SizedBox(height: 8.h),
        TextField(
          controller: nameController,
          decoration: InputDecoration(
            hintText: 'e.g. Sarah Khalid',
            errorText: nameErrorText,
          ),
        ),
        SizedBox(height: 24.h),
        Center(
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () async {
                _validateUserName();
                cacheHelper.saveData(
                  key: 'username',
                  value: nameController.text,
                );
                nameController.clear();
                // ignore: use_build_context_synchronously
                validate ? context.go(AppRoutes.home) : null;
              },
              child: Text(
                'Let’s Get Started',
                // style: context.textTheme.bodyMedium,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
