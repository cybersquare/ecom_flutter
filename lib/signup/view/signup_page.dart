import 'package:csecom/router/router_constants.dart';
import 'package:csecom/signup/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);
  TextEditingController _nameTextController = TextEditingController(text: "");
  TextEditingController _addressTextController =
      TextEditingController(text: "");
  TextEditingController _emailTextController = TextEditingController(text: "");
  TextEditingController _passwordTextController =
      TextEditingController(text: "");
  SignupBloc _signupBloc = SignupBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignupBloc>(
      create: (context) => _signupBloc,
      child: BlocConsumer<SignupBloc, SignupState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            // appBar: AppBar(
            //   toolbarHeight: 70,
            //   title: Text("Signup"),
            // ),
            body: Container(
              margin: EdgeInsets.only(top: .30.sw, right: .05.sw, left: .05.sw),
              // decoration: Decoration,
              decoration: BoxDecoration(
                color: Colors.white54,
                border: Border.all(color: Colors.black12),
              ),
              height: .725.sh,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Image.asset(
                      "assets/images/cs_ecom_logo.png",
                      height: 60,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30, bottom: 20),
                    child: Text(
                      "signup",
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      style: TextStyle(height: .15),
                      keyboardType: TextInputType.text,
                      controller: _nameTextController,
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
                      controller: _addressTextController,
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
                      controller: _emailTextController,
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
                      controller: _passwordTextController,
                      decoration: InputDecoration(
                        hintText: "Password",
                        border: OutlineInputBorder(),
                      ),
                      obscureText: true,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton(
                      child: Container(
                        child: Center(
                          child: Text("Create Account"),
                        ),
                        // color: Color(0xFFAB47BC),
                        color: Colors.blue,
                        height: 40,
                        width: 130,
                      ),
                      onPressed: () {
                        _signupBloc.add(
                          SaveUserDetailsEvent(
                            name: _nameTextController.value.text,
                            address: _addressTextController.value.text,
                            email: _emailTextController.value.text,
                            password: _passwordTextController.value.text,
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      child: Text(
                        "Already have an account?",
                        style: TextStyle(fontSize: 18),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, RouteConstants.loginRoute);
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
