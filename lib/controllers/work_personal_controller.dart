import 'package:flutter/material.dart';

class WorkPersonalProvider extends ChangeNotifier {
  List<bool> workPersonalController = [true, false,];

  bool get isWork => workPersonalController[0];
  bool get isPersonal => workPersonalController[1];

  void setWork() {
    workPersonalController = [true, false,];
    notifyListeners();
  }
  void setPersonal() {
    workPersonalController = [false, true,];
    notifyListeners();
  }
}