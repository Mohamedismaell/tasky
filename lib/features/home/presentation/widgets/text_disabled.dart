import 'package:flutter/material.dart';
import 'package:to_do_app/core/theme/extensions/theme_extension.dart';
import 'package:to_do_app/features/home/presentation/models/task_input.dart';

class TextDisabled extends StatelessWidget {
  const TextDisabled({
    super.key,
    required this.name,
    required this.description,
    required this.task,
    required this.child,
  });
  final bool name;
  final bool description;
  final TaskInput task;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return AnimatedDefaultTextStyle(
      duration: const Duration(milliseconds: 300),
      style: name
          ? context.textTheme.bodyLarge!.copyWith(
              color: task.isDone
                  ? context.colorTheme.onSurface
                  : context.colorTheme.onPrimary,
              decoration: task.isDone
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
            )
          : context.textTheme.bodyMedium!.copyWith(
              fontSize: 16,
              color: task.isDone
                  ? context.colorTheme.onSurface
                  : context.colorTheme.onSurface,
              decoration: task.isDone
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
            ),
      child: child,
    );
  }
}
