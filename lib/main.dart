import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mynotes/views/login_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HOMEPAGE'),
      ),
      body: FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:

            case ConnectionState.done:
              final currentuser = FirebaseAuth.instance.currentUser;

              if (currentuser?.emailVerified ?? false) {
                print('you are verified');
              } else {
                print("please verify first");
              }
              print(currentuser);
              return const Text("homepage");
            default:
              return const Text('Loading.........');
          }
        },
      ),
    );
  }
}
