import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:paml_exercice_2/screen/Form_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List _listdata = [];

  Future _getdata() async {
    try {
      final Response = await http
          .get(Uri.parse('http://192.168.1.11/api/restoapi/read.php'));
      if (Response.statusCode == 200) {
        final data = jsonDecode(Response.body);
        setState(() {
          _listdata = data;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    _getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kuliner Tour"),
      ),
      body: ListView.builder(
        itemCount: _listdata.length,
        itemBuilder: ((context, index) {
          return Card(
            child: ListTile(
              title: Text(_listdata[index]['nama']),
              subtitle: Text(_listdata[index]['rate_resto']),
            ),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
          child: Text(
            "+",
            style: TextStyle(fontSize: 25),
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FormScreen(),
                ));
          }),
    );
  }
}
