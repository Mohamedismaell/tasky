import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/core/theme/extensions/theme_extension.dart';
import 'package:to_do_app/core/widget/custom_text_form_field.dart';
import 'package:to_do_app/features/home/presentation/manager/task_validation/task_validation_cubit.dart';

class TaskForm extends StatelessWidget {
  const TaskForm({super.key});
  // required this.isEditing
  // final bool isEditing;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskValidationCubit, TaskValidationState>(
      builder: (context, state) {
        String? taskNameError;
        String? descriptionError;
        final taskValidationCubit = context.read<TaskValidationCubit>();
        if (state is TaskValidationFailure) {
          taskNameError = state.taskNameError;
          descriptionError = state.taskDescriptionError;
        }
        return Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Task Name', style: context.textTheme.titleMedium),
              SizedBox(height: 8.h),
              CustomTextFormField(
                hinttext: 'Finish UI design for login screen...',
                errorMessage: taskNameError,
                onChanged: taskValidationCubit.updadteTaskName,
              ),
              SizedBox(height: 20.h),
              Text('Task Description', style: context.textTheme.titleMedium),
              SizedBox(height: 8.h),
              CustomTextFormField(
                hinttext:
                    'Finish onboarding UI and hand off to devs by Thursday...',
                errorMessage: descriptionError,
                onChanged: taskValidationCubit.updadteTaskDescription,
                maxLines: 4,
              ),
            ],
          ),
        );
      },
    );
  }
}
