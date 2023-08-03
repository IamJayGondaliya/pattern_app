import 'package:flutter/cupertino.dart';

class NumProvider extends ChangeNotifier {
  int _n = 1;
  static MainAxisAlignment alignment = MainAxisAlignment.start;
  String? group;

  get getNum {
    return _n;
  }

  void onChanged({required int n}) {
    _n = n;
    notifyListeners();
  }

  void updateAlign({required MainAxisAlignment alignment}) {
    NumProvider.alignment = alignment;
    notifyListeners();
  }

  void updateButton({required String value}) {
    group = value;
    print("Val: $group");
    notifyListeners();
  }

  void patterUpdate() {
    notifyListeners();
  }
}
