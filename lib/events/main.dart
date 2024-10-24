import 'package:flutter/material.dart';
import 'package:flutter_application_1/myapp.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';


void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('tasksBox');
  runApp(const MyApp());
}