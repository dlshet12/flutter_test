import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class LoanProvider extends ChangeNotifier {
  // Existing loan-related data
  double _pendingAmount = 0.0;
  double get pendingAmount => _pendingAmount;

  void setPendingAmount(double amount) {
    _pendingAmount = amount;
    notifyListeners();
  }

  // Settings Data
  Map<String, dynamic>? _settingsData;
  bool _isSettingsLoaded = false;

  Map<String, dynamic>? get settingsData => _settingsData;

  Future<void> fetchSettingsData() async {
    if (!_isSettingsLoaded) {
      // Simulating API call (Replace with actual API if available)
      await Future.delayed(Duration(seconds: 2)); // Simulating delay
      _settingsData = {
        "theme": "Dark",
        "language": "English",
      };
      _isSettingsLoaded = true;
      notifyListeners();
    }
  }

  // Unsplash images for Notifications Page (Random)
  List<String> _unsplashImages = [];
  bool _isImagesLoaded = false;

  List<String> get unsplashImages => _unsplashImages;

  Future<void> fetchUnsplashImages() async {
    if (!_isImagesLoaded) {
      final url = Uri.parse(
        'https://api.unsplash.com/photos/random?count=5&client_id=uEBT29Z36M1XkJ15L-PmQZxcSvlxR_fhARYY4DYtMTE',
      );

      try {
        final response = await http.get(url);
        if (response.statusCode == 200) {
          List<dynamic> data = json.decode(response.body);
          _unsplashImages = data.map((item) => item['urls']['regular'].toString()).toList();
          _isImagesLoaded = true;
          notifyListeners();
        } else {
          throw Exception('Failed to load random images');
        }
      } catch (error) {
        print("Error fetching random Unsplash images: $error");
      }
    }
  }

  // Unsplash images for Settings Page (Regular Photos)
  List<String> _unsplashPhotos = [];
  bool _isPhotosLoaded = false;

  List<String> get unsplashPhotos => _unsplashPhotos;

  Future<void> fetchUnsplashPhotos() async {
    if (!_isPhotosLoaded) {
      final url = Uri.parse(
        'https://api.unsplash.com/photos?per_page=5&client_id=uEBT29Z36M1XkJ15L-PmQZxcSvlxR_fhARYY4DYtMTE',
      );

      try {
        final response = await http.get(url);
        if (response.statusCode == 200) {
          List<dynamic> data = json.decode(response.body);
          _unsplashPhotos = data.map((item) => item['urls']['regular'].toString()).toList();
          _isPhotosLoaded = true;
          notifyListeners();
        } else {
          throw Exception('Failed to load photos');
        }
      } catch (error) {
        print("Error fetching Unsplash photos: $error");
      }
    }
  }
}
