import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/core/theme/extensions/theme_extension.dart';
import 'package:to_do_app/features/home/presentation/manager/cubit/task_validation_cubit.dart';
import 'package:to_do_app/features/home/presentation/models/task_input.dart';

class AllTasks extends StatelessWidget {
  const AllTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskValidationCubit, TaskValidationState>(
      builder: (context, state) {
        // Access the list from your Cubit
        final List<TaskInput> tasks = context.read<TaskValidationCubit>().tasks;

        return Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(
            tasks.length,
            (index) => Padding(
              padding: EdgeInsets.only(bottom: 8.h),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: context.colorTheme.surface,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                // height: 100.h,
                // color: Colors.red,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 8.h),
                  child: Row(
                    children: [
                      Checkbox(
                        activeColor: context.colorTheme.primary,
                        value: tasks[index].isDone,
                        onChanged: (value) => context
                            .read<TaskValidationCubit>()
                            .updadteChecked(index, value!),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              textAlign: TextAlign.center,
                              tasks[index].title,
                              // style: context.textTheme.bodyMedium,
                            ),
                            Text(
                              textAlign: TextAlign.center,
                              tasks[index].description,
                              // style: context.textTheme.bodyMedium,
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
              ),
            ),
          ),
        );
      },
    );
  }
}
