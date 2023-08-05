import 'package:flutter/material.dart';

import '../widgets/hamburger_menu.dart';

// https://stackoverflow.com/questions/57793479/flutter-futurebuilder-gets-constantly-called
late Future initFuture;

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: initFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // Then display our app's main screen
            return Scaffold(
              drawer: HamburgerMenu(),
              appBar: AppBar(
                title: Text(widget.title),
              ),
              body: const SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'This is some text',
                    ),
                  ],
                ),
              ),
            );
          } else {
            // Display the initialization message
            return Scaffold(
                appBar: AppBar(title: Text(widget.title)),
                body: SafeArea(
                    child: Center(
                        child: Container(
                            child: Text('Loading configuration...')))));
          } // if (!snapshot.hasData)
        });
  }
}
