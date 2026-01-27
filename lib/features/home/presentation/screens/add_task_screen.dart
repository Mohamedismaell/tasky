import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
              _buildPrioritySwitch(),
              Spacer(),
              _buildAddTaskButton(),
              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildAddTaskButton() {
  return SizedBox(
    width: double.infinity,
    child: ElevatedButton.icon(
      onPressed: () {},
      icon: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: Icon(Icons.add),
      ),
      label: Text('Add Task'),
    ),
  );
}

Widget _buildPrioritySwitch() {
  final ValueNotifier<bool> isPriority = ValueNotifier(false);
  return Row(
    children: [
      Text('Priority'),
      Spacer(),
      ValueListenableBuilder(
        valueListenable: isPriority,
        builder: (context, value, child) => Switch(
          value: value,
          onChanged: (value) {
            isPriority.value = !isPriority.value;
          },
        ),
      ),
    ],
  );
}
