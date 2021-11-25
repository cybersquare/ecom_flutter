import 'package:flutter/material.dart';

class ViewProfile extends StatelessWidget {
  const ViewProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   toolbarHeight: MediaQuery.of(context).size.height / 2.5,
      //   elevation: 0,
      //   // leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
      //   title: Center(
      //     child: Column(
      //       children: [
      //         CircleAvatar(
      //           radius: MediaQuery.of(context).size.height / 7,
      //           backgroundImage: NetworkImage(
      //             "https://www.freeiconspng.com/thumbs/profile-icon-png/female-user-icon-clip-art--30.png",
      //           ),
      //           backgroundColor: Colors.red,
      //         ),
      //         Padding(
      //           padding: const EdgeInsets.all(10.0),
      //           child: Text("Surya Kiran"),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Address"),
                  Text("Locality"),
                  Text("District"),
                  Text("State"),
                  Text("Nationality"),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Phantom house"),
                  Text("Olavanna"),
                  Text("Calicut"),
                  Text("Kerala"),
                  Text("India"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
