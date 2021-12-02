import 'package:csecom/viewProfile/views/widgets/edit_address_popup.dart';
import 'package:flutter/material.dart';

class ProfileDetails extends StatelessWidget {
  ProfileDetails({Key? key, required this.keyName, required this.keyValue})
      : super(key: key);
  String keyName;
  String keyValue;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Divider(
          thickness: 1,
          height: 0.1,
        ),
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
                  children: const [
                    Text('Baabte system technologies, Cafit square'),
                    Text('Hilite business park'),
                    Text('Calicut'),
                    Text('Kerala'),
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
          onTap: () {},
        ),
        const Divider(
          thickness: 1,
          height: 0.1,
        ),
      ],
    );
  }
}
