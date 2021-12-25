import 'package:csecom/home/bloc/home_bloc.dart';
import 'package:csecom/router/router_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SideNavigationBar extends StatelessWidget {
  SideNavigationBar({Key? key, required this.blocInstance}) : super(key: key);
  HomeBloc blocInstance;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is UserLogoutState) {
          Navigator.pushNamed(context, RouteConstants.loginRoute);
        }
      },
      builder: (context, state) {
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
                title: Text('Reset password'),
                leading: Icon(Icons.reset_tv),
                onTap: () {
                  Navigator.pushNamed(context, RouteConstants.resetpwdRoute);
                },
              ),
              Divider(),
              ListTile(
                title: Text('Logout'),
                leading: Icon(Icons.logout),
                onTap: () {
                  blocInstance.add(UserLogoutEvent());
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
