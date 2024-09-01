import 'package:cloud_firestore/cloud_firestore.dart';

class Materi {
  String id;
  String judul;
  String konten;

  Materi({required this.id, required this.judul, required this.konten});

  factory Materi.fromDocument(DocumentSnapshot doc) {
    return Materi(
      id: doc.id,
      judul: doc['judul'],
      konten: doc['konten'],
    );
  }
}
