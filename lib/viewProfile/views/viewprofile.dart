import 'package:csecom/viewProfile/views/widgets/edit_address_popup.dart';
import 'package:csecom/viewProfile/views/widgets/profile_header.dart';
import 'package:flutter/material.dart';

import 'widgets/profile_details_list.dart';

class ViewProfile extends StatelessWidget {
  const ViewProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[50],
        toolbarHeight: MediaQuery.of(context).size.width / 3,
        title: ProfileHeader(),
        actions: [
          TextButton(
            onPressed: () {
              showDialog<dynamic>(
                  context: context,
                  builder: (BuildContext context) {
                    return EditAddressPopup();
                  });
            },
            child: const Text(
              'Edit',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 20),
        child: ProfileDetails(keyName: 'Name', keyValue: 'surya'),
      ),
    );
  }
}
