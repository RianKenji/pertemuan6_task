import 'package:pertemuan6/models/data_layer.dart';
import 'package:pertemuan6/models/task.dart';

class Plan{
  String name = '';
  final List<Task> tasks = [];

  int get completeCount => tasks.where((task) => task.complete).length;
  String get completenessMessage => '$completeCount out of ${tasks.length} tasks';

}