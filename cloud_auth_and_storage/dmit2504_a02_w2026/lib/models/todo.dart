import 'package:cloud_firestore/cloud_firestore.dart';

class Todo {
  String description;
  bool isComplete;
  String? id;

  Todo({required this.description, required this.isComplete, this.id});

  // Factory constructor to convert from firestore document snapshot to Todo model
  factory Todo.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();
    return Todo(
      description: data!['description'],
      isComplete: data['isComplete'],
      id: snapshot.id,
    );
  }

  // Function that converts to a map for entry into firestore
  Map<String, dynamic> toMap() {
    return {'description': description, 'isComplete': isComplete};
  }
}
