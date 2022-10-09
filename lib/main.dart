import 'package:flutter/material.dart';
import '/services/services.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppServices.init();
  runApp(MyApp());
}
