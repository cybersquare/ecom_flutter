import 'package:csecom/login/login.dart';
import 'package:csecom/router/router_constants.dart';
import 'package:csecom/signup/view/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  TextEditingController _emailController = TextEditingController(text: ""),
      _passwordController = TextEditingController(text: "");
  LoginBloc _loginBloc = LoginBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) => _loginBloc,
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            // appBar: AppBar(
            //   leading: Text(''),
            //   toolbarHeight: 70,
            //   // title: Text("CS Ecommerce"),
            //   title: Text("Login"),
            //   // Image.asset(
            //   //   "assets/images/cs_ecom_logo.png",
            //   //   height: 80,
            //   //   width: 150,
            //   // ),
            // ),
            body: Container(
              margin: EdgeInsets.only(top: 30, right: 20, left: 20),
              // decoration: Decoration,
              decoration: BoxDecoration(
                color: Colors.white54,
                border: Border.all(color: Colors.black12),
              ),
              height: 520,
              child: Column(
                // mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Image.asset(
                      "assets/images/cs_ecom_logo.png",
                      height: 60,
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(bottom: 30),
                  //   child: Text(
                  //     "Sign in",
                  //     style: TextStyle(
                  //       fontSize: 45.0,
                  //       fontWeight: FontWeight.bold,
                  //       color: Color(0xFFAB47BC),
                  //     ),
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10.0,
                      bottom: 30.0,
                      right: 10.0,
                      left: 10.0,
                    ),
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: "Email",
                        border: OutlineInputBorder(),
                      ),
                      controller: _emailController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Password",
                        border: OutlineInputBorder(),
                      ),
                      controller: _passwordController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: ElevatedButton(
                      onPressed: () {
                        _loginBloc.add(
                          LoginWithEmailAndPassword(
                            email: _emailController.text,
                            password: _passwordController.text,
                          ),
                        );
                      },
                      child: Container(
                        child: Center(
                          child: Text("Login"),
                        ),
                        color: Colors.blue,
                        height: 40,
                        width: 60,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: TextButton(
                      child: Text("Forgot Password?"),
                      onPressed: () {},
                    ),
                  ),
                  TextButton(
                    child: Text("Create an Account?"),
                    onPressed: () {
                      // print("haii");
                      Navigator.pushNamed(context, RouteConstants.signupRoute);
                      // _loginBloc.add(NavigateToSignup());
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
