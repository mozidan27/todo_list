import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/core/database/cache/cache_helper.dart';
import 'package:todo_list/core/services/service_locator.dart';
import 'package:todo_list/features/auth/presentation/screen/sign_in_view.dart';
import 'package:todo_list/features/home/presentation/screen/home_view.dart';
import 'package:todo_list/features/onboarding/presentation/screen/onboarding_view.dart';

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

late bool isOnboardingVisited;

class _AuthGateState extends State<AuthGate> {
  @override
  void initState() {
    isOnboardingVisited =
        getIt<CacheHelper>().getData(key: "isOnboardingVisited") ?? false;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (!isOnboardingVisited) {
            // User hasn't visited onboarding yet
            return const OnBoardingView();
          }

          if (snapshot.hasData) {
            return const HomeView();
          } else {
            // You might want a LoginView here instead of onboarding!
            return const SignInView();
          }
        },
      ),
    );
  }
}
