import 'package:flutter/material.dart';
import 'package:paml_exercice_2/model/resto.dart';
import 'package:paml_exercice_2/screen/detail_screen.dart';
import 'package:paml_exercice_2/service/home_service.dart';
import 'package:paml_exercice_2/screen/Form_screen.dart';
import 'package:paml_exercice_2/screen/edit_screen.dart';

class HomeController {
  final RestoService _restoService = RestoService();

  Future<List<Map<String, dynamic>>> getData() async {
    return _restoService.getData();
  }

  Future<bool> deleteData(String id) async {
    return _restoService.deleteData(id);
  }

  void navigateToEditScreen(BuildContext context, Map<String, dynamic> data) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditScreen(listData: data),
      ),
    );
  }

  void navigateToFormScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const FormScreen(),
      ),
    );
  }
}
