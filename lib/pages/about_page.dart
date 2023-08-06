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
          title: Text('About'),
        ),
        body: SafeArea(
            child: ListView(padding: const EdgeInsets.all(16.0), children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    width: 2,
                  ),
                ),
                child: Image.asset("assets/images/app-icon-128.png"),
              )
            ],
          ),
          Text("This is the remote garage door opener application for the "
              "Fumbly Stuff Garage Controller device. The app lets you "
              "remotely push the garage door button on a garage door connected "
              "to the Garage Controller device."),
          SizedBox(height: 10),
          Text("With this application, you'll define profiles for each of "
              "the Garage Controller devices through the app's Settings page. "
              "Once that's done, the app's home page will display a list of "
              "the configured controllers. Select one of the listed "
              "controllers, and a page opens allowing you to push the remote "
              "button or create a single-use URL you can send to another "
              "person so they'll be able to remotely open the garage door"),
          SizedBox(height: 20),
          Text("Application Information",
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
          Divider(thickness: 3),
          appInfoStr('Application name', _packageInfo.appName),
          appInfoStr('Package name', _packageInfo.packageName),
          appInfoStr('Application version', _packageInfo.version),
          appInfoStr('Build number', _packageInfo.buildNumber),
        ])));
  }
}
