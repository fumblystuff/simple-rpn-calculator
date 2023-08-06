import 'package:flutter/material.dart';

import '../widgets/hamburger_menu.dart';

// final log = Logger(appName);

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const HamburgerMenu(),
        appBar: AppBar(title: Text(widget.title)),
        body: const SafeArea(
            child: Center(
          child: Text('This is some text'),
        )));
  } // if (!snapshot.hasData)
}
