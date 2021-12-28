import 'package:csecom/router/router_constants.dart';
import 'package:csecom/viewProfile/viewprofile.dart';
import 'package:csecom/viewProfile/views/widgets/edit_address_popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ProfileDetails extends StatelessWidget {
  ProfileDetails({
    Key? key,
    required this.address,
    required this.viewprofileBloc,
  }) : super(key: key);
  TextEditingController address;
  ViewprofileBloc viewprofileBloc;

  // final spinkit = SpinKitSquareCircle(
  //   color: Colors.white,
  //   size: 50.0,
  //   controller: AnimationController(
  //       vsync: this, duration: const Duration(milliseconds: 1200)),
  // );

  @override
  Widget build(BuildContext context) {
    // return BlocProvider<ViewprofileBloc>(
    //   create: (context) => viewprofileBloc,
    //   child: BlocConsumer<ViewprofileBloc, ViewprofileState>(
    //     listener: (context, state) {

    //     },
    //     builder: (context, state) {
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
                    Text(address.text),
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
                return EditAddressPopup(
                  addressController: address,
                  viewProfileBloc: viewprofileBloc,
                );
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
          onTap: () {
            Navigator.of(context).pushNamed(RouteConstants.cart);
          },
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
            viewprofileBloc..add(SignOutEvent());
          },
        ),
        const Divider(
          thickness: 1,
          height: 0.1,
        ),
      ],
    );
    //       },
    //     ),
    //   );
  }
}
