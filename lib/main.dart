import 'package:flutter/material.dart';
import 'package:netify/app/app.dart';
import 'package:netify/app/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();
  runApp(Netify());
}
