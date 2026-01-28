import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/core/injection/common_di.dart';
import 'package:to_do_app/core/theme/extensions/theme_extension.dart';
import 'package:to_do_app/features/home/presentation/manager/cubit/task_validation_cubit.dart';
import 'package:to_do_app/features/home/presentation/models/task_input.dart';

class Progerss extends StatelessWidget {
  const Progerss({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskValidationCubit, TaskValidationState>(
      builder: (context, state) {
        final List<TaskInput> tasks = context.read<TaskValidationCubit>().tasks;
        // print(tasks.map((e) => print(e)));

        final doneTasks = tasks.where((task) => task.isDone).toList();
        return Container(
          decoration: BoxDecoration(
            color: context.colorTheme.surface,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: Row(
              children: [
                Column(
                  children: [
                    Text('Achieved Tasks', style: context.textTheme.bodyLarge),
                    Text('${doneTasks.length} Out of ${tasks.length} Done'),
                  ],
                ),
                Spacer(),
                Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // final tasks = context
                        //     .read<TaskValidationCubit>()
                        //     .loadFromCacheTasks();
                        // print('Cashed Tasks$doneTasks');
                        // print('tasks ${cacheHelper.getData(key: 'tasks')}');
                      },
                      child: SizedBox(
                        width: 48.w,
                        height: 48.h,
                        child: TweenAnimationBuilder<double>(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                          tween: Tween<double>(
                            begin: 0,
                            end: tasks.isEmpty
                                ? 0
                                : doneTasks.length / tasks.length,
                          ),
                          builder: (context, value, _) {
                            return CircularProgressIndicator(
                              value: value,
                              backgroundColor: context.colorTheme.onSurface,
                              strokeWidth: 6,
                            );
                          },
                        ),
                      ),
                    ),
                    TweenAnimationBuilder(
                      duration: Duration(milliseconds: 500),
                      tween: Tween<double>(
                        begin: 0,
                        end: tasks.isEmpty
                            ? 0
                            : ((doneTasks.length / tasks.length) * 100),
                      ),
                      builder: (context, value, child) => Text(
                        '${value.ceil()}%',
                        style: context.textTheme.bodyLarge!.copyWith(
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
