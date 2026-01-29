import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/core/theme/extensions/theme_extension.dart';
import 'package:to_do_app/features/home/presentation/manager/cubit/task_validation_cubit.dart';
import 'package:to_do_app/features/home/presentation/models/task_input.dart';
import 'package:to_do_app/features/home/presentation/widgets/card_container.dart';
import 'package:to_do_app/features/home/presentation/widgets/text_disabled.dart';

class ListTasks extends StatelessWidget {
  const ListTasks({super.key, required this.allTaks, required this.toDoTasks});
  final bool allTaks;
  final bool toDoTasks;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskValidationCubit, TaskValidationState>(
      builder: (context, state) {
        List<TaskInput> tasks = state.tasks;
        if (toDoTasks) {
          tasks = tasks.where((task) => !task.isDone).toList();
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (tasks.isEmpty)
              Padding(
                padding: EdgeInsets.only(top: 20.h),
                child: Center(
                  child: Text('No Tasks', style: context.textTheme.titleMedium),
                ),
              )
            else
              ...List.generate(tasks.length, (index) {
                final currentTask = tasks[index];
                return Padding(
                  padding: EdgeInsets.only(bottom: 8.h),
                  child: cardContainer(
                    context: context,
                    child: Row(
                      children: [
                        Checkbox(
                          activeColor: context.colorTheme.primary,
                          value: currentTask.isDone,
                          onChanged: (value) => context
                              .read<TaskValidationCubit>()
                              .updateChecked(currentTask.id, value!),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              TextDisabled(
                                name: true,
                                description: false,
                                task: currentTask,
                                child: Text(
                                  textAlign: TextAlign.center,
                                  currentTask.title,
                                  // softWrap: false,
                                ),
                              ),
                              TextDisabled(
                                name: false,
                                description: true,
                                task: currentTask,
                                child: Text(
                                  textAlign: TextAlign.center,
                                  currentTask.description,
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.more_vert_rounded),
                        ),
                      ],
                    ),
                  ),
                );
              }),
          ],
        );
      },
    );
  }
}
