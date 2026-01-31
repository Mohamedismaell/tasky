import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/core/theme/extensions/theme_extension.dart';
import 'package:to_do_app/features/home/presentation/manager/task_validation/task_validation_cubit.dart';
import 'package:to_do_app/features/home/presentation/models/task_input.dart';
import 'package:to_do_app/features/home/presentation/widgets/card_container.dart';
import 'package:to_do_app/features/home/presentation/widgets/text_disabled.dart';

class PriorityTasks extends StatelessWidget {
  const PriorityTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskValidationCubit, TaskValidationState>(
      builder: (context, state) {
        final List<TaskInput> allTasks = state.tasks;
        final List<TaskInput> priorityTasks = allTasks
            .where((task) => task.isPriority)
            .toList();
        return cardContainer(
          context: context,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10.w),
                      child: Text(
                        'My Tasks',
                        style: context.textTheme.bodyLarge!.copyWith(
                          color: context.colorTheme.primary,
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    ...List.generate(priorityTasks.length, (index) {
                      final currentTask = priorityTasks[index];
                      return Padding(
                        padding: EdgeInsets.only(bottom: 8.h),
                        child: Row(
                          children: [
                            Checkbox(
                              activeColor: context.colorTheme.primary,
                              value: currentTask.isDone,
                              onChanged: (value) => context
                                  .read<TaskValidationCubit>()
                                  .updateChecked(currentTask.id, value!),
                            ),
                            SizedBox(width: 4.w),
                            TextDisabled(
                              name: true,
                              description: false,
                              task: currentTask,
                              child: Text(
                                textAlign: TextAlign.center,
                                currentTask.title,
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ],
                ),
              ),
              IconButton(
                style: IconButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  side: BorderSide(color: context.colorTheme.outline),
                ),
                icon: Transform.rotate(
                  angle: 5.5,
                  child: Icon(Icons.arrow_forward, size: 24.sp),
                ),
                onPressed: () {},
              ),
            ],
          ),
        );
      },
    );
  }
}
