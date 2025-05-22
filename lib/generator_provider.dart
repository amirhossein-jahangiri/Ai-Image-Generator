import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:image_gallery_saver_plus/image_gallery_saver_plus.dart';

enum RequestStatus { idle, loading, success, error }

class GeneratorProvider with ChangeNotifier {
  Uint8List? _imageSrc;

  Uint8List? get imageSrc => _imageSrc;

  RequestStatus _requestStatus = RequestStatus.idle;

  RequestStatus get requestStatus => _requestStatus;

  String? _message;

  String? get message => _message;

  Future<void> generateImageFromPrompt(String prompt) async {
    _requestStatus = RequestStatus.loading;
    _message = '';
    notifyListeners();

    final Uri url = Uri.parse(
      'https://image.pollinations.ai/prompt/$prompt?nologo=true',
    );

    try {
      final http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        Uint8List bytes = response.bodyBytes;
        _imageSrc = bytes;
        _requestStatus = RequestStatus.success;
        notifyListeners();
      } else {
        _message = 'Unknown Error';
        _requestStatus = RequestStatus.error;
        notifyListeners();
      }
    } catch (e) {
      if (e is SocketException) {
        _message =
            'Network error: Please check your internet connection and try again.';
        _requestStatus = RequestStatus.error;
      } else if (e is TimeoutException) {
        _message =
            'Request timed out: The server took too long to respond. Please try again later.';
        _requestStatus = RequestStatus.error;
      } else {
        _message = 'An unexpected error occurred: Please try again.';
        _requestStatus = RequestStatus.error;
      }
      notifyListeners();
    }
  }

  Future<bool> saveImage() async {
    _message = '';
    if (imageSrc == null || imageSrc!.isEmpty) return false;

    try {
      final result = await ImageGallerySaverPlus.saveImage(
        imageSrc!,
        quality: 100,
        name: "my_image_${DateTime.now().millisecondsSinceEpoch}",
      );
      if (result['isSuccess'] == true || result['success'] == true) {
        _message = "Image saved successfully!";
        return true;
      } else {
        _message = "Failed to save image.";
        return false;
      }
    } catch (e) {
      _message = "Error saving image: $e";
      return false;
    }
  }

  void resetStatus() {
    _requestStatus = RequestStatus.idle;
    notifyListeners();
  }
}
