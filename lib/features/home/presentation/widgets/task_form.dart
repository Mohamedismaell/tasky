import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/core/theme/extensions/theme_extension.dart';
import 'package:to_do_app/features/home/presentation/manager/cubit/task_validation_cubit.dart';

class TaskForm extends StatefulWidget {
  const TaskForm({super.key});

  @override
  State<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  late final GlobalKey<FormState> formKey;

  @override
  void initState() {
    formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    formKey.currentState?.dispose();
    super.dispose();
  }

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
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Task Name', style: context.textTheme.titleSmall),
              SizedBox(height: 8.h),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Finish UI design for login screen...',
                  errorText: taskNameError,
                ),
                onChanged: taskValidationCubit.updadteTaskName,
              ),
              SizedBox(height: 20.h),
              Text('Task Description', style: context.textTheme.titleSmall),
              SizedBox(height: 8.h),
              TextFormField(
                maxLines: 4,
                decoration: InputDecoration(
                  hintText:
                      'Finish onboarding UI and hand off to devs by Thursday...',
                  errorText: descriptionError,
                ),
                onChanged: taskValidationCubit.updadteTaskDescription,
              ),
            ],
          ),
        );
      },
    );
  }
}
