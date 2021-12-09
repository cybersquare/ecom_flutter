import 'package:csecom/router/router_constants.dart';
import 'package:flutter/material.dart';

class NavigationBar extends StatelessWidget {
  const NavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('John'),
            accountEmail: Text('John@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  'assets/images/profile.jfif',
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.purple,
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('My account'),
            onTap: () {
              Navigator.pushNamed(context, RouteConstants.profileRoute);
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_bag),
            title: Text('Orders'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.category),
            title: Text('Categories'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text('About us'),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            title: Text('Logout'),
            leading: Icon(Icons.logout),
            onTap: () => null,
          ),
        ],
      ),
    );
  }
}
