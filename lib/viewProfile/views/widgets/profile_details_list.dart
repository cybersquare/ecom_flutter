import 'package:csecom/router/router_constants.dart';
import 'package:csecom/viewProfile/viewprofile.dart';
import 'package:csecom/viewProfile/views/widgets/edit_address_popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ProfileDetails extends StatelessWidget {
  ProfileDetails({Key? key, required this.address}) : super(key: key);
  String address;
  ViewprofileBloc _viewprofileBloc = ViewprofileBloc();

  // final spinkit = SpinKitSquareCircle(
  //   color: Colors.white,
  //   size: 50.0,
  //   controller: AnimationController(
  //       vsync: this, duration: const Duration(milliseconds: 1200)),
  // );

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ViewprofileBloc>(
      create: (context) => _viewprofileBloc,
      child: BlocConsumer<ViewprofileBloc, ViewprofileState>(
        listener: (context, state) {
          print("object");
          if (state is NavigateToLoginState) {
            print("logout navigation start");
            Navigator.pushNamed(context, RouteConstants.loginRoute);
          }
        },
        builder: (context, state) {
          return ListView(
            children: [
              // const Divider(
              //   thickness: 1,
              //   height: 0.1,
              // ),
              InkWell(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: ListTile(
                    // leading: Text("Name"),
                    title: const Text(
                      'Address',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(address),
                          // Text('Hilite business park'),
                          // Text('Calicut'),
                          // Text('Kerala'),
                        ],
                      ),
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.arrow_forward_ios),
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  showDialog<dynamic>(
                    context: context,
                    builder: (BuildContext context) {
                      return EditAddressPopup();
                    },
                  );
                },
              ),
              const Divider(
                thickness: 1,
                height: 0.1,
              ),
              InkWell(
                child: const ListTile(
                  // leading: Text("Name"),
                  title: Text('My Orders'),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
                onTap: () {},
              ),
              const Divider(
                thickness: 1,
                height: 0.1,
              ),
              InkWell(
                child: const ListTile(
                  // leading: Text("Name"),
                  title: Text('My Cart'),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
                onTap: () {},
              ),
              const Divider(
                thickness: 1,
                height: 0.1,
              ),
              InkWell(
                child: const ListTile(
                  // leading: Text("Name"),
                  title: Text('Notifications'),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
                onTap: () {},
              ),
              const Divider(
                thickness: 1,
                height: 0.1,
              ),
              InkWell(
                child: const ListTile(
                  // leading: Text("Name"),
                  title: Text('Return Policy'),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
                onTap: () {},
              ),
              const Divider(
                thickness: 1,
                height: 0.1,
              ),
              InkWell(
                child: const ListTile(
                  // leading: Text("Name"),
                  title: Text('My Rewards'),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
                onTap: () {},
              ),
              const Divider(
                thickness: 1,
                height: 0.1,
              ),
              InkWell(
                child: const ListTile(
                  // leading: Text("Name"),
                  title: Text('Log out'),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
                onTap: () {
                  _viewprofileBloc..add(SignOutEvent());
                },
              ),
              const Divider(
                thickness: 1,
                height: 0.1,
              ),
            ],
          );
        },
      ),
    );
  }
}
