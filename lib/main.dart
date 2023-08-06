import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';
import 'package:logging/logging.dart';

import './pages/home.dart';

const appName = 'Simple RPN Calculator';
final log = Logger(appName);

void main() {
  // Global settings for the logging package
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    // format the date the way I want it
    String formattedDate = DateFormat('HH:mm:ss:SS').format(record.time);
    // Build a string with the number of spaces we need between the label
    // and the message
    String spaces = ' ' * (7 - record.level.name.length);
    print(
        '$formattedDate ${record.loggerName} (${record.level.name})$spaces ${record.message}');
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
      //   useMaterial3: true,
      // ),
      home: const HomePage(title: appName),
      builder: EasyLoading.init(),
    );
  }
}
