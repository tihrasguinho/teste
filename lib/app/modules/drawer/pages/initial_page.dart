import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                final firestore = FirebaseFirestore.instance;

                final query = await firestore.collection('users').get();

                for (var doc in query.docs) {
                  print('${doc.data()}');
                }
              },
              child: Text('HOME'),
            ),
            ElevatedButton(
              onPressed: () async {
                final messaging = FirebaseMessaging.instance;

                final token = await messaging.getToken();

                print(token);
              },
              child: Text('TOKEN'),
            ),
          ],
        ),
      ),
    );
  }
}
