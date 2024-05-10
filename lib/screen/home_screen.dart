import 'package:flutter/material.dart';
import 'package:paml_exercice_2/controller/home_controller.dart';
import 'package:paml_exercice_2/model/resto.dart';
import 'package:paml_exercice_2/screen/detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController _controller = HomeController();
  List<Map<String, dynamic>> _listData = [];

  @override
  void initState() {
    _getData();
    super.initState();
  }

  Future<void> _getData() async {
    final data = await _controller.getData();
    setState(() {
      _listData = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kuliner Tour"),
        backgroundColor: const Color.fromARGB(146, 7, 212, 205),
        elevation: 15,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: _listData.length,
        itemBuilder: (context, index) {
          return Card(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(ListData: {
                      'id': _listData[index]['id'],
                      'rate_resto': _listData[index]['rate_resto'],
                      'nama': _listData[index]['nama'],
                      'notelp': _listData[index]['notelp'],
                    }),
                  ),
                );
              },
              child: ListTile(
                title: Text(_listData[index]['nama']),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(_listData[index]['rate_resto']),
                    Text(_listData[index]['alamat']),
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        _showDeleteDialog(_listData[index]['rate_resto']);
                      },
                      icon: const Icon(Icons.delete_forever),
                    ),
                    IconButton(
                      onPressed: () {
                        _controller.navigateToEditScreen(
                            context, _listData[index]);
                      },
                      icon: Icon(Icons.info),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Text(
          "+",
          style: TextStyle(fontSize: 25),
        ),
        onPressed: () {
          _controller.navigateToFormScreen(context);
        },
      ),
    );
  }

  Future<void> _showDeleteDialog(String id) async {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          content: const Text('Yakin Mau Hapus Data?'),
          actions: [
            ElevatedButton(
              onPressed: () {
                _controller.deleteData(id).then((value) {
                  if (value) {
                    _listData.removeWhere((data) => data['rate_resto'] == id);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Data telah dihapus'),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Data gagal dihapus'),
                      ),
                    );
                  }
                });
                Navigator.pop(context);
              },
              child: const Text("Yakin !!"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Tidak Jadi"),
            ),
          ],
        );
      },
    );
  }
}
