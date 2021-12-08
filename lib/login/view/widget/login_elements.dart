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
  LoginBloc _loginBloc = LoginBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) => _loginBloc,
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          print(state);
          if (state is NavigateToHomeScreen) {
            Navigator.pushNamed(context, RouteConstants.profileRoute);
            return showTopSnackBar(
              context,
              CustomSnackBar.success(
                message: "Successfully logged in.....",
              ),
            );
          } else {
            return showTopSnackBar(
              context,
              CustomSnackBar.error(
                message:
                    "Login Failed... Please check your credentials and try again",
              ),
            );
          }
        },
        builder: (context, state) {
          return Column(
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
                  top: 10.0,
                  bottom: 30.0,
                  right: 10.0,
                  left: 10.0,
                ),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    // errorText: "Inavlid username",
                    hintText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  controller: _emailController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Password',
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
                    color: Colors.blue,
                    height: 40,
                    width: 60,
                    child: const Center(
                      child: Text("Login"),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
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
          );
        },
      ),
    );
  }
}
