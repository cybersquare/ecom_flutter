import 'dart:developer';
import 'package:csecom/router/router_constants.dart';
import 'package:flutter/material.dart';
import 'package:csecom/counter/counter.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IconButton(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute<MaterialPageRoute>(
              //       builder: (context) => CounterPage()),
              // );
              Navigator.pushNamed(context, RouteConstants.counterRoute);
            },
            icon: Icon(Icons.send)),
      ),
    );
  }
}
