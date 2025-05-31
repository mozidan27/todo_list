import 'package:flutter/material.dart';

void customnavigate(context, String path) {
  Navigator.pushNamed(context, path);
}

void customReplacementNavigate(BuildContext context, String path) {
  Navigator.pushReplacementNamed(context, path);
}
