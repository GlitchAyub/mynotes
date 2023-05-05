import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key});

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify Email'),
      ),
      body: Column(
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
      ),
    );
  }
}