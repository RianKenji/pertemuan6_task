import 'package:flutter/material.dart';
import 'package:pertemuan6/controllers/plan_controllers.dart';

class PlanProvider extends InheritedWidget{
  final _controller = PlanController();

  PlanProvider({Key? key, required Widget child}) :
        super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;

  static PlanController? of(BuildContext context){
    PlanProvider? provider = context.dependOnInheritedWidgetOfExactType<PlanProvider>();
    return provider?._controller;
  }

}