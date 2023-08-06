/*
 * Garage Controller About Page
 */
// https://pub.dev/packages/package_info/example

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPage createState() => _AboutPage();
}

class _AboutPage extends State<AboutPage> {
  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
  );

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  Future<void> _initPackageInfo() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  Widget appInfoStr(String title, String subtitle) {
    title += ": ";
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Text.rich(TextSpan(children: [
        TextSpan(text: title, style: TextStyle(fontWeight: FontWeight.bold)),
        TextSpan(text: subtitle.isNotEmpty ? subtitle : 'Not set'),
      ])),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('About'),
        ),
        body: SafeArea(
            child: ListView(padding: const EdgeInsets.all(16.0), children: [
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   mainAxisSize: MainAxisSize.max,
          //   children: <Widget>[
          //     Container(
          //       padding: EdgeInsets.all(5),
          //       margin: EdgeInsets.all(5),
          //       decoration: BoxDecoration(
          //         color: Colors.white,
          //         border: Border.all(
          //           width: 2,
          //         ),
          //       ),
          //       child: Image.asset("assets/images/app-icon-128.png"),
          //     )
          //   ],
          // ),
          const Text("This is a free and advertisement free Simple Reverse "
              "Polish Notation (RPN) calculator."),
          const SizedBox(height: 10),
          const Text("By John M. Wargo"),
          const SizedBox(height: 20),
          const Text("Application Information",
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
          const Divider(thickness: 3),
          appInfoStr('Application name', _packageInfo.appName),
          appInfoStr('Package name', _packageInfo.packageName),
          appInfoStr('Application version', _packageInfo.version),
          appInfoStr('Build number', _packageInfo.buildNumber),
        ])));
  }
}
