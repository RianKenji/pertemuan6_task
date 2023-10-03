import 'package:pertemuan6/models/data_layer.dart';
import 'package:pertemuan6/services/plan_services.dart';

class PlanController {
  //final _plans = <Plan>[];
  final services = PlanServices();

  List<Plan> get plans => List.unmodifiable(services.getAllPlans());

  void addNewPlan(String name){
    if(name.isEmpty) return;

    name = _checkForDuplicate(plans.map((plan) => plan.name), name);

    services.createPlan(name);

    /*final plan = Plan()..name = name;
    _plans.add(plan);*/
  }

  void savePlan (Plan plan){
    services.savePlan(plan);
  }

  void deletePlan(Plan plan){
    services.delete(plan);
  }

  void createNewTask(Plan plan, [String? description]){
    if(description == null || description.isEmpty){
      description = 'new Task';
    }

    description = _checkForDuplicate(plan.tasks.map((task) => task.description), description);
    final task = Task()..description = description;
    plan.tasks.add(task);
  }

  void deleteTask(Plan plan, Task task){
    services.deleteTask(plan, task);
  }

  String _checkForDuplicate(Iterable<String> items, String text){
    final duplicatedCount = items.where((item) => item.contains(text)).length;
    if(duplicatedCount > 0) {
      text += '${duplicatedCount + 1}';
    }
    return text;
  }
}