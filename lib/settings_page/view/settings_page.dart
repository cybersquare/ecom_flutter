import 'package:csecom/app/view/app.dart';
import 'package:csecom/router/router_constants.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            ListTile(
              title: Text('Edit profile'),
              onTap: () {
                Navigator.pushNamed(context, RouteConstants.profileRoute);
              },
            ),
            ListTile(
              title: Text('Reset passoword'),
              onTap: () {
                Navigator.pushNamed(context, RouteConstants.resetpwdRoute);
              },
            ),
            ListTile(
              title: Text('Logout'),
              onTap: () {
                Navigator.pushNamed(context, RouteConstants.loginRoute);
              },
            ),
          ],
        ),
      ),
    );
  }
}
