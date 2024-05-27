import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetUserName extends StatelessWidget {
   GetUserName({super.key, required this.documentId});

  final String documentId;
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    //get the collection

    return FutureBuilder(future: users.doc(documentId).get(), builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        Map<String, dynamic> data = snapshot.data!.data() as Map<String , dynamic>;
        return Text('${data['first name']}' +
            '\t${data['last name']}'+
            ' \t${data['age']} years old');
      }
      return Text('loading');
    });
  }
}
