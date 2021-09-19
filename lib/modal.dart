import 'package:flutter/cupertino.dart';
import 'databaseService.dart';

class UserModal extends ChangeNotifier {
  late String _uid;
  late String _name;
  String _pronoun = "";

  String getUid() => _uid;
  void updateUid(String newUid) {
    _uid = newUid;
    notifyListeners();
  }

  String getName() => _name;
  void updateName(String newName) {
    _uid = newName;
    notifyListeners();
  }

  String getPrnoun() => _pronoun;
  void updatePronoun(String newPro) {
    _uid = newPro;
    notifyListeners();
  }
}
