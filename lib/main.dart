import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_list/app/todo_app.dart';
import 'package:todo_list/core/database/cache/cache_helper.dart';
import 'package:todo_list/core/services/service_locator.dart';
import 'package:todo_list/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Hive.initFlutter();
  setupServiceLocator();
  await getIt<CacheHelper>().init();
  await Hive.openBox('mybox');
  await Hive.openBox('mypic');
  runApp(const TODo());
}
