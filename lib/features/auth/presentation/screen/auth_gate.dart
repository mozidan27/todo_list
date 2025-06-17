import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/features/home/presentation/screen/home_view.dart';
import 'package:todo_list/features/onboarding/presentation/screen/onboarding_view.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          return snapshot.hasData ? HomeView() : const OnBoardingView();
        },
      ),
    );
  }
}
