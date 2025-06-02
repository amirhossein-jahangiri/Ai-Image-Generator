import 'package:flutter/foundation.dart';


class HomeViewModel with ChangeNotifier {


  int _currentSliderIndex = 0;
  int get currentSliderIndex => _currentSliderIndex;



  /// trigger header slider indicator and update it with change image
  void triggerHeaderSlider(int index) {
    _currentSliderIndex = index;
    notifyListeners();
  }

}