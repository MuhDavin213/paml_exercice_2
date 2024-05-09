import 'package:flutter/material.dart';
import 'package:paml_exercice_2/controller/edit_controller.dart';

class EditScreen extends StatefulWidget {
  final Map<String, dynamic> listData;

  const EditScreen({Key? key, required this.listData}) : super(key: key);

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _rateRestoController = TextEditingController();
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _alamatController = TextEditingController();

  final EditController _controller = EditController();

  @override
  void initState() {
    _rateRestoController.text = widget.listData['rate_resto'];
    _namaController.text = widget.listData['nama'];
    _alamatController.text = widget.listData['alamat'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Data"),
        backgroundColor: const Color.fromARGB(146, 7, 212, 205),
        elevation: 15,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _rateRestoController,
                decoration: InputDecoration(
                  hintText: "Rating Restaurant",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Rating resto tidak boleh kosong";
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _namaController,
                decoration: InputDecoration(
                  hintText: "Nama Restaurant",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Nama resto tidak boleh kosong";
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _alamatController,
                decoration: InputDecoration(
                  hintText: "Alamat Restaurant",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Alamat resto tidak boleh kosong";
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 32, 231, 195),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final Map<String, String> data = {
                      "id": widget.listData['id'],
                      "rate_resto": _rateRestoController.text,
                      "nama": _namaController.text,
                      "alamat": _alamatController.text,
                    };
                    _controller.updateData(data).then((value) {
                      if (value) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Data telah diupdate'),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Gagal update data'),
                          ),
                        );
                      }
                      _controller.navigateToHomeScreen(context);
                    });
                  }
                },
                child: Text("Update"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
