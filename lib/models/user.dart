import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String email;

  User({
    this.email,
  });

  factory User.fromDocument(DocumentSnapshot doc) {
    return User(
      email: doc['email'] as String,
    );
  }
}
