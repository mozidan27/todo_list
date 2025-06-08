import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/features/auth/presentation/cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  String? emailAddress;
  String? password;
  String? firstName;
  String? lastName;
  bool? termsAndServiceCheckBoxValue = false;
  bool? obscurePasswordTextValue = true;
  GlobalKey<FormState> signUpFromKey = GlobalKey();
  GlobalKey<FormState> signInFromKey = GlobalKey();
  GlobalKey<FormState> resetPasswordFromKey = GlobalKey();
  //!sign up method
  Future<void> signUpWithEmailAndPassword() async {
    try {
      emit(SignUpLoading());
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress!,
        password: password!,
      );

      emit(SignUpSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(SignUpFauiler(errorMessage: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(
          SignUpFauiler(
            errorMessage: 'The account already exists for that email.',
          ),
        );
      } else {
        emit(SignUpFauiler(errorMessage: "Something went wrong ${e.code}"));
      }
    } catch (e) {
      emit(SignUpFauiler(errorMessage: e.toString()));
    }
  }

  //!sign in method

  Future<void> signInWithEmailAndPassword() async {
    try {
      emit(SignInLoading());
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress!,
        password: password!,
      );

      emit(SignInSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(SignInFauiler(errorMessage: 'No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(
          SignInFauiler(errorMessage: 'Wrong password provided for that user.'),
        );
      } else {
        emit(SignInFauiler(errorMessage: "Something went wrong ${e.code}"));
      }
    } catch (e) {
      emit(SignInFauiler(errorMessage: e.toString()));
    }
  }
}
