import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddMateriScreen extends StatefulWidget {
  @override
  _AddMateriScreenState createState() => _AddMateriScreenState();
}

class _AddMateriScreenState extends State<AddMateriScreen> {
  final _formKey = GlobalKey<FormState>();
  String _judul = '';
  String _konten = '';

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      FirebaseFirestore.instance.collection('materi').add({
        'judul': _judul,
        'konten': _konten,
      }).then((_) {
        Navigator.of(context).pop();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Materi Baru'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Judul'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Judul tidak boleh kosong';
                  }
                  return null;
                },
                onSaved: (value) {
                  _judul = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Konten'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Konten tidak boleh kosong';
                  }
                  return null;
                },
                onSaved: (value) {
                  _konten = value!;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Simpan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
