import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_todo/models/models.dart';

import 'screens/screens.dart';

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter<Contact>(ContactAdapter());
  await Hive.openBox<Contact>('contacts');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/home',
      getPages: [
        GetPage(name: '/home', page: () => HomeScreen()),
        GetPage(name: '/add', page: () => AddContactScreen()),
        GetPage(name: '/detail', page: () => DetailScreen()),
      ],
      title: 'Hive Todo App',
    );
  }
}
