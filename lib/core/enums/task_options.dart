enum TaskValidationType { fullName, taskName, taskDescription }

enum UserValidationType { username, motivationQuote }

enum TaskOptions {
  update(name: 'Update'),
  delete(name: 'Delete');

  final String name;

  const TaskOptions({required this.name});
}
