import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/theme/extensions/theme_extension.dart';
import 'package:to_do_app/features/home/presentation/manager/task_validation/task_validation_cubit.dart';

class PrioritySwitch extends StatefulWidget {
  const PrioritySwitch({super.key, this.lastPriority});
  final bool? lastPriority;
  @override
  State<PrioritySwitch> createState() => _PrioritySwitchState();
}

class _PrioritySwitchState extends State<PrioritySwitch> {
  late bool _value;
  @override
  void initState() {
    super.initState();

    final cubit = context.read<TaskValidationCubit>();

    _value = widget.lastPriority ?? cubit.taskPriority;

    cubit.updadteTaskPriority(_value);
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TaskValidationCubit>();

    return Row(
      children: [
        Text('High Priority', style: context.textTheme.titleMedium),
        const Spacer(),
        Switch(
          value: _value,
          onChanged: (value) {
            setState(() {
              _value = value;
              cubit.updadteTaskPriority(value);
            });
          },
        ),
      ],
    );
  }
}
