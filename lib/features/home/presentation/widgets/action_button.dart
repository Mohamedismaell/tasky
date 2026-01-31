import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do_app/features/home/presentation/manager/task_validation/task_validation_cubit.dart';
import 'package:to_do_app/features/home/presentation/models/task_input.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({super.key, this.task});
  final TaskInput? task;
  @override
  Widget build(BuildContext context) {
    return BlocListener<TaskValidationCubit, TaskValidationState>(
      listener: (context, state) {
        if (state is TaskValidationSuccess) {
          context.pop();
          context.read<TaskValidationCubit>().reset();
        }
      },
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton.icon(
          onPressed: () {
            task == null
                ? context.read<TaskValidationCubit>().submit()
                : context.read<TaskValidationCubit>().startEdit(task!);
            print('Edite');
            // context.pop();
          },
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
