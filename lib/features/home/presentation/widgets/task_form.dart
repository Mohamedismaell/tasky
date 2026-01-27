import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/core/theme/extensions/theme_extension.dart';

class TaskForm extends StatefulWidget {
  TaskForm({super.key});

  @override
  State<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  late TextEditingController taskNameController;

  late TextEditingController taskDescriptionController;

  late GlobalKey<FormState> formKey;
  @override
  void initState() {
    taskNameController = TextEditingController();
    taskDescriptionController = TextEditingController();
    formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    taskNameController.dispose();
    taskDescriptionController.dispose();
    formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Task Name', style: context.textTheme.titleSmall),
          SizedBox(height: 8.h),
          TextFormField(
            controller: taskNameController,
            decoration: InputDecoration(
              hintText: 'Finish UI design for login screen...',
            ),
          ),
          SizedBox(height: 20.h),
          Text('Task Description', style: context.textTheme.titleSmall),
          SizedBox(height: 8.h),
          TextFormField(
            maxLines: 4,
            controller: taskDescriptionController,
            decoration: InputDecoration(
              hintText:
                  'Finish onboarding UI and hand off to devs by Thursday...',
            ),
          ),
        ],
      ),
    );
  }
}
