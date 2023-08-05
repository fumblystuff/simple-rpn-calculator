import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logging/logging.dart';
import 'package:url_launcher/url_launcher.dart';

import '../pages/about_page.dart';
import '../pages/settings_page.dart';

const docUrl = 'https://garagecontroller.com';

final log = Logger('GarageController');

class HamburgerMenu extends StatelessWidget {
  const HamburgerMenu({Key? key}) : super(key: key);

  void _launchDocsUrl() async {
    log.info('Launching $docUrl');
    try {
      await launch(docUrl, forceSafariVC: false, forceWebView: false);
    } catch (e) {
      log.info('Error launching URL');
      log.info(e);
      Fluttertoast.showToast(
          msg: "Unable to launch browser window",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          // backgroundColor: Colors.red,
          // textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              child: Stack(children: <Widget>[
                Positioned(
                    bottom: 12.0,
                    left: 16.0,
                    child: Text("Garage Controller",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold))),
              ])),
          ListTile(
            leading: Icon(
              Icons.info,
              color: Colors.blue.shade400,
              size: 24.0,
              semanticLabel: 'About icon',
            ),
            title: Text('About'),
            onTap: () {
              log.info('Opening About page');
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: Colors.blue.shade400,
              size: 24.0,
              semanticLabel: 'Settings icon',
            ),
            title: Text('Settings'),
            onTap: () {
              log.info('Opening Settings page');
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              ).then((value) => {print("returned")});
            },
          ),
          ListTile(
            leading: Icon(
              Icons.help_outline,
              color: Colors.blue.shade400,
              size: 24.0,
              semanticLabel: 'Help icon',
            ),
            title: Text('Documentation'),
            onTap: () {
              Navigator.pop(context);
              _launchDocsUrl();
            },
          ),
        ],
      ),
    );
  }
}
