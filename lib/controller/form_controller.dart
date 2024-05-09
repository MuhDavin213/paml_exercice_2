import 'package:flutter/material.dart';
import 'package:paml_exercice_2/screen/home_screen.dart';
import 'package:paml_exercice_2/service/form_service.dart';

class FormController {
  final RestoService _restoService = RestoService();

  Future<bool> simpanData(Map<String, String> data) async {
    return _restoService.createData(data);
  }

  void navigateToHomeScreen(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
      (route) => false,
    );
  }
}
