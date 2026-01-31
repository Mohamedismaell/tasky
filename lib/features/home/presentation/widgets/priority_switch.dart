import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/theme/extensions/theme_extension.dart';
import 'package:to_do_app/features/home/presentation/manager/task_validation/task_validation_cubit.dart';

class PrioritySwitch extends StatelessWidget {
  const PrioritySwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('High Priority', style: context.textTheme.titleMedium),
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
}
