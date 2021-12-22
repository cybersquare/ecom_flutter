import 'package:csecom/login/login.dart';
import 'package:csecom/router/router_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class LoginElements extends StatelessWidget {
  LoginElements({Key? key}) : super(key: key);
  final TextEditingController _emailController =
          TextEditingController(text: ''),
      _passwordController = TextEditingController(text: '');
  final LoginBloc _loginBloc = LoginBloc();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) => _loginBloc,
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is NavigateToHomeScreen) {
            print("navigate to home screen detected");
            Navigator.pushNamed(context, RouteConstants.homeRoute);
            return showTopSnackBar(
              context,
              const CustomSnackBar.success(
                message: 'Successfully logged in.....',
              ),
            );
          } else {
            return showTopSnackBar(
              context,
              const CustomSnackBar.error(
                message:
                    'Login Failed... Please check your credentials and try again',
              ),
            );
          }
        },
        builder: (context, state) {
          return Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10, top: 20),
                  child: Image.asset(
                    'assets/images/cs_ecom_logo.png',
                    height: 50,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                    bottom: 30,
                    right: 10,
                    left: 10,
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      // errorText: "Inavlid username",
                      hintText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                    controller: _emailController,
                    validator: (value) {
                      var p =
                          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                      final regExp = RegExp(p);

                      if (value!.isEmpty) {
                        return 'Please enter your username';
                      } else if (regExp.hasMatch(value) == false) {
                        return 'Please enter valid username';
                      }
                      // return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                    controller: _passwordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please enter your password';
                      } else if (value.length < 6) {
                        return 'Please enter a valid password';
                      }
                      // return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: TextButton(
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate() == false) {
                          print("login test");
                        } else {
                          _loginBloc.add(
                            LoginWithEmailAndPassword(
                              email: _emailController.text,
                              password: _passwordController.text,
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: TextButton(
                    child: const Text('Forgot Password?'),
                    onPressed: () {
                      Navigator.pushNamed(
                          context, RouteConstants.resetpwdRoute);
                    },
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RouteConstants.signupRoute);
                    // _loginBloc.add(NavigateToSignup());
                  },
                  child: const Text('Create an Account?'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
