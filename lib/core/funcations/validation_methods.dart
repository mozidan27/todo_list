import 'package:flutter/material.dart';

String? nameValidation(value) {
  if (value == null || value.isEmpty) {
    return "This field is required";
  }
  if (value.length < 3) {
    return 'Password must be at least 3 characters';
  } else {
    return null;
  }
}

String? passwordValidation(String? value) {
  if (value == null || value.isEmpty) {
    return 'Password is required';
  }
  if (value.length > 25) {
    return 'Password must be less than 25 characters';
  }

  if (value.length < 8) {
    return 'Password must be at least 8 characters';
  }

  if (value.contains(' ')) {
    return 'Password should not contain spaces';
  }

  if (!RegExp(r'[A-Z]').hasMatch(value)) {
    return 'Password must contain at least one uppercase letter';
  }

  if (!RegExp(r'[a-z]').hasMatch(value)) {
    return 'Password must contain at least one lowercase letter';
  }

  if (!RegExp(r'[0-9]').hasMatch(value)) {
    return 'Password must contain at least one digit';
  }

  if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
    return 'Password must contain at least one special character';
  }

  return null; // Password is valid
}

String? phoneValidation(value) {
  if (value == null ||
      value.isEmpty ||
      !RegExp(r'^[0-9]{11}$').hasMatch(value)) {
    return 'Enter a valid phone number (11 digits)';
  }
  return null;
}

String? emailValidation(String? value) {
  if (value == null || value.isEmpty) {
    return 'Email is required';
  }

  if (value.startsWith(' ')) {
    return 'Remove the leading space';
  }

  if (value.endsWith(' ')) {
    return 'Remove the trailing space';
  }

  if (value.contains(' ')) {
    return 'Email should not contain spaces';
  }

  if (!value.contains('@')) {
    return 'Email must contain "@"';
  }

  if (value.indexOf('@') == 0) {
    return 'Email should not start with "@"';
  }

  if (value.indexOf('@') != value.lastIndexOf('@')) {
    return 'Email should contain only one "@"';
  }

  List<String> parts = value.split('@');
  String localPart = parts[0];
  String domainPart = parts.length > 1 ? parts[1] : '';

  if (localPart.isEmpty) {
    return 'Email must have characters before "@"';
  }

  if (!RegExp(r'^[\w-.]+$').hasMatch(localPart)) {
    return 'Invalid characters before "@"';
  }

  if (!domainPart.contains('.')) {
    return 'Domain must contain at least one dot "."';
  }

  if (!RegExp(r'^[\w-]+\.[\w-]{2,6}$').hasMatch(domainPart)) {
    return 'Invalid domain format';
  }

  return null;
}

String? confirmPasswordValidator(
  String? value,
  TextEditingController passwordController,
) {
  if (value == null || value.length < 8) {
    return 'Password confirmation is required';
  } else if (value != passwordController.text) {
    return "Passwords don't match!";
  }
  return null;
}
