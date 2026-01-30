import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/core/enums/task_options.dart';
import 'package:to_do_app/core/theme/extensions/theme_extension.dart';
import 'package:to_do_app/features/home/presentation/manager/task_validation/task_validation_cubit.dart';
import 'package:to_do_app/features/home/presentation/models/task_input.dart';
import 'package:to_do_app/features/home/presentation/widgets/card_container.dart';
import 'package:to_do_app/features/home/presentation/widgets/text_disabled.dart';

class CustomeListTasks extends StatelessWidget {
  const CustomeListTasks({super.key, required this.allTaks});
  final bool allTaks;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskValidationCubit, TaskValidationState>(
      builder: (context, state) {
        List<TaskInput> tasks = state.tasks;

        return tasks.isEmpty
            ? SliverPadding(
                padding: EdgeInsets.only(top: 20.h),
                sliver: SliverToBoxAdapter(
                  child: Center(
                    child: Text(
                      'No Tasks',
                      style: context.textTheme.titleMedium,
                    ),
                  ),
                ),
              )
            : SliverList.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
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
                          // _buildMoreButton(context, currentTask),
                          PopupMenuButton<TaskOptions>(
                            itemBuilder: (context) =>
                                TaskOptions.values.map((e) {
                                  // print('map e => $e');
                                  return PopupMenuItem<TaskOptions>(
                                    value: e,
                                    child: Text(e.name),
                                  );
                                }).toList(),
                            // onOpened: () => print('opened'),
                            // onCanceled: () => print('canceled'),
                            onSelected: (value) {
                              switch (value) {
                                case TaskOptions.delete:
                                  print(value);
                                  break;
                                case TaskOptions.update:
                                  print(value);
                                  break;
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
      },
    );
  }
}
// Widget _buildMoreButton(BuildContext context, TaskInput task) {
//   return IconButton(
//     onPressed: () {
//       switch (task.id) {
//         case TaskOption.delete.name:
//           break;
//         case TaskOption.update.name:
//           break;
//       }
//     },
//     icon: Icon(Icons.more_vert_rounded),
//   );
// }