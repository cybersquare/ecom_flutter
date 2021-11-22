import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 70,
        title: Text("Signup"),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 80, right: 20, left: 20),
        // decoration: Decoration,
        decoration: BoxDecoration(
          color: Colors.white54,
          border: Border.all(color: Colors.black12),
        ),
        height: 520,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 20),
              child: Text(
                "signup",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                style: TextStyle(height: .15),
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: "Name",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                style: TextStyle(height: 1),
                keyboardType: TextInputType.multiline,
                maxLines: 2,
                decoration: InputDecoration(
                  hintText: "Address",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                style: TextStyle(height: .15),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "Email",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                style: TextStyle(height: .15),
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: "Password",
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
            ),
            ElevatedButton(
              child: Container(
                child: Center(child: Text("Create Account")),
                color: Colors.blue,
                height: 40,
                width: 130,
              ),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
