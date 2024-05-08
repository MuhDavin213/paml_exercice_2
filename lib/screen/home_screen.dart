import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:paml_exercice_2/screen/Form_screen.dart';
import 'package:paml_exercice_2/screen/edit_screen.dart';

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

  Future _delete(String id) async {
    try {
      final Response = await http.post(
          Uri.parse('http://192.168.1.11/api/restoapi/delete.php'),
          body: {
            "rate_resto": id,
          });
      if (Response.statusCode == 200) {
        return true;
      } else
        return false;
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
        backgroundColor: Color.fromARGB(146, 7, 212, 205),
        elevation: 15,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: _listdata.length,
        itemBuilder: ((context, index) {
          return Card(
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditScreen(
                        ListData: {
                          "id": _listdata[index]['id'],
                          "rate_resto": _listdata[index]['rate_resto'],
                          "nama": _listdata[index]['nama'],
                          "alamat": _listdata[index]['alamat']
                        },
                      ),
                    ));
              },
              child: ListTile(
                title: Text(_listdata[index]['nama']),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(_listdata[index]['rate_resto']),
                    Text(_listdata[index]['alamat']),
                  ],
                ),
                trailing: IconButton(
                    onPressed: () {
                      showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: ((context) {
                            return AlertDialog(
                              content:
                                  Text('are u sure to Delete this Data ??'),
                              actions: [
                                ElevatedButton(
                                  onPressed: () {
                                    _delete(_listdata[index]['rate_resto'])
                                        .then((value) {
                                      if (value) {
                                        final snackBar = SnackBar(
                                          content:
                                              const Text('Data telah Dihapus'),
                                        );
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                      } else {
                                        final snackBar = SnackBar(
                                          content:
                                              const Text('Data Gagal Dihapus '),
                                          action: SnackBarAction(
                                            label: 'Undo',
                                            onPressed: () {
                                              // Some code to undo the change.
                                            },
                                          ),
                                        );
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                      }
                                    });
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: ((context) =>
                                                HomeScreen())),
                                        (route) => false);
                                  },
                                  child: Text("Yakin!!"),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("Tidak jadi"),
                                ),
                              ],
                            );
                          }));
                    },
                    icon: Icon(Icons.delete_forever)),
              ),
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
