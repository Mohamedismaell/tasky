import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/core/theme/extensions/theme_extension.dart';
import 'package:to_do_app/features/home/presentation/manager/cubit/task_validation_cubit.dart';
import 'package:to_do_app/features/home/presentation/widgets/task_form.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('New Task'),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              SizedBox(height: 8.h),
              TaskForm(),
              SizedBox(height: 20.h),
              _buildPrioritySwitch(context),
              Spacer(),
              _buildAddTaskButton(context),
              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAddTaskButton(BuildContext context) {
    return BlocListener<TaskValidationCubit, TaskValidationState>(
      listener: (context, state) {
        // if state
      },
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton.icon(
          onPressed: () => context.read<TaskValidationCubit>().submit(),
          icon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Icon(Icons.add),
          ),
          label: Text('Add Task'),
        ),
      ),
    );
  }
}

Widget _buildPrioritySwitch(BuildContext context) {
  return Row(
    children: [
      Text('High Priority', style: context.textTheme.titleSmall),
      Spacer(),
      BlocBuilder<TaskValidationCubit, TaskValidationState>(
        builder: (context, state) {
          return Switch(
            onChanged: (value) {
              context.read<TaskValidationCubit>().updadteTaskPriority(value);
            },
            value: state is TaskisPriority ? true : false,
          );
        },
      ),
    ],
  );
}
