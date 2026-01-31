import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/features/home/presentation/widgets/action_button.dart';
import 'package:to_do_app/features/home/presentation/widgets/priority_switch.dart';
import 'package:to_do_app/features/home/presentation/widgets/task_form.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.transparent,
        title: Align(
          alignment: AlignmentGeometry.centerLeft,
          child: Text('New Task'),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              SizedBox(height: 8.h),
              TaskForm(),
              SizedBox(height: 20.h),
              PrioritySwitch(),
              Spacer(),
              ActionButton(),
              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }
}

//   Widget _buildAddTaskButton(BuildContext context) {
//     return BlocListener<TaskValidationCubit, TaskValidationState>(
//       listener: (context, state) {
//         if (state is TaskValidationSuccess) {
//           context.pop();
//           context.read<TaskValidationCubit>().reset();
//         }
//       },
//       child: SizedBox(
//         width: double.infinity,
//         child: ElevatedButton.icon(
//           onPressed: () => context.read<TaskValidationCubit>().submit(),
//           icon: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 4.w),
//             child: Icon(Icons.add),
//           ),
//           label: Text('Add Task'),
//         ),
//       ),
//     );
//   }
// }
