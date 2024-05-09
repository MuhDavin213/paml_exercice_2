import 'dart:convert';
import 'dart:ffi';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:paml_exercice_2/model/resto.dart';

class DetailScreen extends StatefulWidget {
  final String nama;
  final String rateResto;
  final String alamat;

  const DetailScreen({
    Key? key,
    required this.nama,
    required this.rateResto,
    required this.alamat,
  }) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<Resto> _futureResto;

  Future<Resto> fetchRestoDetail() async {
    final response = await http.get(
      Uri.parse('http://192.168.1.33/api/restoapi/?id=${widget.rateResto}'),
    );
    if (response.statusCode == 200) {
      // Jika request berhasil, parse JSON response ke dalam objek Resto
      return Resto.fromJson(jsonDecode(response.body));
    } else {
      // Jika request gagal, throw sebuah exception
      throw Exception('Failed to load resto');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Page"),
      ),
      body: FutureBuilder<Resto>(
        future: _futureResto,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                elevation: 12,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        title: Text("Rating Toko"),
                        subtitle: Text(snapshot.data!.rate_resto),
                      ),
                      ListTile(
                        title: Text("Nama Toko"),
                        subtitle: Text(snapshot.data!.nama),
                      ),
                      ListTile(
                        title: Text("Alamat Toko"),
                        subtitle: Text(snapshot.data!.alamat),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
