import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final Map ListData;
  const DetailScreen({Key? key, required this.ListData}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController id = TextEditingController();
  TextEditingController rate_resto = TextEditingController();
  TextEditingController nama = TextEditingController();
  TextEditingController alamat = TextEditingController();
  @override
  Widget build(BuildContext context) {
    id.text = widget.ListData['id'] ?? '';
    rate_resto.text = widget.ListData['ratin_toko'] ?? '';
    nama.text = widget.ListData['nama'] ?? '';
    alamat.text = widget.ListData['telepon'] ?? '';
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail"),
      ),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Card(
          elevation: 12,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: Text("id"),
                  subtitle: Text(widget.ListData['id'] ?? 'No ID'),
                ),
                ListTile(
                  title: Text("Rating Resto"),
                  subtitle:
                      Text(widget.ListData['rate_resto'] ?? 'No Rate_Resto'),
                ),
                ListTile(
                  title: Text("Nama"),
                  subtitle: Text(widget.ListData['nama'] ?? 'No Nama'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
