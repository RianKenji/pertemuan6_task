import 'package:pertemuan6/models/data_layer.dart';
import 'package:pertemuan6/repositories/in_memory_cache.dart';
import 'package:pertemuan6/repositories/repository.dart';

class PlanServices{
  final Repository _repository = InMemoryCache();

  Plan createPlan (String name){
    final model = _repository.create();
    final plan = Plan.fromModel(model)..name = name;
    savePlan(plan);
    return plan;
  }

  void savePlan(Plan plan){
    _repository.delete(plan.toModel());
  }



  List<Plan> getAllPlans(){
    return _repository.getAll().map((model) => Plan.fromModel(model)).toList();
  }

  void addTask(Plan plan, String description){
    final id = plan.tasks.last?.id ?? 0+1;
    final task = Task(id: id, description: description);
    plan.tasks.add(task);
    savePlan(plan);
  }

  void deleteTask(Plan plan, Task task){
    plan.tasks.remove(task);
    savePlan(plan);
  }
}