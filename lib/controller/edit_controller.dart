import 'package:flutter/material.dart';
import 'package:paml_exercice_2/screen/home_screen.dart';
import 'package:paml_exercice_2/service/edit_service.dart';

class EditController {
  final RestoService _restoService = RestoService();

  Future<bool> updateData(Map<String, String> data) async {
    return _restoService.updateData(data);
  }

  void navigateToHomeScreen(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
      (route) => false,
    );
  }
}
