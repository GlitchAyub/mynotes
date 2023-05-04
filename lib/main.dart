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
            case ConnectionState.done:
            
              final currentuser = FirebaseAuth.instance.currentUser;
               print(currentuser);

              // if (currentuser?.emailVerified ?? false) {
              //   return const Text("done");
              // } else {
              //   return const VerifyEmailView();
              // }
              return const LoginView();
             

            default:
              return const Text('Loading....!');
          }
        },
      ),
    );
  }
}

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key});

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('please verify an Email'),
        TextButton(
          onPressed: () async {
            final currentuser = FirebaseAuth.instance.currentUser;
            await currentuser?.sendEmailVerification();
          },
          child: const Text('Send Email Verification'),
        )
      ],
    );
  }
}
