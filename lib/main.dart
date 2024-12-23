import 'package:flutter/material.dart';
import 'package:wheely/features/app/factory.dart';

import 'features/app/app.dart';
import 'core/di/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  AppFactory.init();
  runApp(const MainApp());
}