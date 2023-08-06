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
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Scaffold(
        drawer: const HamburgerMenu(),
        appBar: AppBar(title: Text(widget.title)),
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Row(
              children: [
                ElevatedButton(
                  style: style,
                  onPressed: null,
                  child: const Text('Disabled'),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  style: style,
                  onPressed: () {},
                  child: const Text('Enabled'),
                ),
              ],
            ),
            const Row(
              children: [
                Expanded(
                  child: Text('Row 2', textAlign: TextAlign.center),
                ),
              ],
            ),
            const Row(
              children: [
                Expanded(
                  child: Text('Row 3', textAlign: TextAlign.center),
                ),
              ],
            ),
            const Row(
              children: [
                Expanded(
                  child: Text('Row 4', textAlign: TextAlign.center),
                ),
              ],
            ),
          ],
        )));
  } // if (!snapshot.hasData)
}
