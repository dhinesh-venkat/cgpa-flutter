import 'package:flutter/material.dart';
import '../models/entry.dart';

class Entries with ChangeNotifier {
  Map<String, Entry> _items = {};

  Map<String, int> gradePoint = {
    'S': 10,
    'A': 9,
    'B': 8,
    'C': 7,
    'D': 6,
    'E': 5,
    'F': 0,
  };

  Map<String, Entry> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get calculate {
    double result = 0.0;
    int totalCredit = 0;
    _items.forEach((key, value) {
      result += gradePoint[value.grade] * value.credit;
      totalCredit += value.credit;
    });
    print(result);
    print(totalCredit);
    return num.parse((result / totalCredit).toStringAsFixed(3));
  }

  void addItem(int id, String grade, int credit) {
    _items.addAll({id.toString(): Entry(id: id, grade: grade, credit: credit)});
    notifyListeners();
  }

  void updateItem(int id, String grade, int credit) {
    _items.update(id.toString(), (value) => Entry(id: id,grade: grade,credit: credit));
    notifyListeners();

  }

  void reset() {
    _items = {};
    notifyListeners();
  }
}
