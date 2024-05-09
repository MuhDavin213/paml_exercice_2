import 'package:flutter/material.dart';
import 'package:paml_exercice_2/model/resto.dart';

class DetailScreen extends StatefulWidget {
  final Resto resto;
  const DetailScreen({Key? key, required this.resto}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController rate_resto = TextEditingController();
  TextEditingController nama = TextEditingController();
  TextEditingController alamat = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Inisialisasi TextEditingController dengan nilai dari ListData
    rate_resto.text = widget.resto.rate_resto ?? '';
    nama.text = widget.resto.nama ?? '';
    alamat.text = widget.resto.alamat ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Page"),
      ),
      body: Padding(
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
                  subtitle: Text(widget.resto.rate_resto),
                ),
                ListTile(
                  title: Text("Nama Toko"),
                  subtitle: Text(widget.resto.nama),
                ),
                ListTile(
                  title: Text("Alamat Toko"),
                  subtitle: Text(widget.resto.alamat),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
