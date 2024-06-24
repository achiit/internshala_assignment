import 'package:flutter/foundation.dart';

class FilterViewModel extends ChangeNotifier {
  bool _isChecked = false;
  int? _selectedDuration;
  List<String> _selectedProfiles = [];
  List<String> _selectedLocations = [];
  List<String> get selectedLocations => _selectedLocations;
  List<String> get selectedProfiles => _selectedProfiles;
  bool get isChecked => _isChecked;
  int? get selectedDuration => _selectedDuration;

  set isChecked(bool value) {
    _isChecked = value;
    notifyListeners();
  }
  void updateSelectedProfiles(List<String> profiles) {
    _selectedProfiles = profiles;
    notifyListeners();
  }
    void updateSelectedLocation(List<String> Locations) {
    _selectedLocations = Locations;
    notifyListeners();
  }
  set selectedDuration(int? value) {
    _selectedDuration = value;
    notifyListeners();
  }

  void clearAll() {
    _isChecked = false;
    _selectedDuration = null;
    _selectedProfiles = [];
    _selectedLocations = [];
    notifyListeners();
  }
}
