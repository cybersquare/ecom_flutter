import 'package:csecom/router/router_constants.dart';
import 'package:csecom/signup/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);
  final TextEditingController _nameTextController =
      TextEditingController(text: '');
  final TextEditingController _addressTextController =
      TextEditingController(text: '');
  final TextEditingController _emailTextController =
      TextEditingController(text: '');
  final TextEditingController _passwordTextController =
      TextEditingController(text: '');
  final SignupBloc _signupBloc = SignupBloc();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignupBloc>(
      create: (context) => _signupBloc,
      child: BlocConsumer<SignupBloc, SignupState>(
        listener: (context, state) {
          if (state is NavigateToLogin) {
            Navigator.pushNamed(context, RouteConstants.homeRoute);
            return showTopSnackBar(
              context,
              const CustomSnackBar.success(
                message: 'User registred successfully',
              ),
            );
          } else if (state is SignUpFailed) {
            if (state.emailUseError == true) {
              showTopSnackBar(
                context,
                const CustomSnackBar.error(
                  message: 'Already registred with this mail',
                ),
              );
            } else {
              showTopSnackBar(
                context,
                const CustomSnackBar.error(
                  message:
                      'Something went wrong. Please check your credentials and try again',
                ),
              );
            }
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              body: SingleChildScrollView(
                child: Container(
                  margin:
                      EdgeInsets.only(top: 60.sp, right: .05.sw, left: .05.sw),
                  decoration: BoxDecoration(
                    color: Colors.white54,
                    border: Border.all(color: Colors.black12),
                  ),
                  height: 630.sp,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Image.asset(
                          'assets/images/cs_ecom_logo.png',
                          height: 60.sp,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 20),
                        child: Text(
                          'signup',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your name';
                                  } else if (value.characters.length < 3) {
                                    return 'Name should contains atleast 3 characters';
                                  }
                                  return null;
                                },
                                style: const TextStyle(height: .15),
                                keyboardType: TextInputType.text,
                                controller: _nameTextController,
                                decoration: const InputDecoration(
                                  hintText: 'Name',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: TextFormField(
                                style: const TextStyle(height: 1),
                                keyboardType: TextInputType.multiline,
                                maxLines: 2,
                                controller: _addressTextController,
                                decoration: const InputDecoration(
                                  hintText: 'Address',
                                  border: OutlineInputBorder(),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your address';
                                  } else if (value.characters.length < 3) {
                                    return 'Address should contains atleast 3 characters';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: TextFormField(
                                style: const TextStyle(height: .15),
                                keyboardType: TextInputType.emailAddress,
                                controller: _emailTextController,
                                decoration: const InputDecoration(
                                  hintText: 'Email',
                                  border: OutlineInputBorder(),
                                ),
                                validator: (value) {
                                  String p =
                                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                  RegExp regExp = new RegExp(p);

                                  if (value!.isEmpty) {
                                    return 'Please enter your email';
                                  }
                                  if (regExp.hasMatch(value) == false) {
                                    return 'Please enter valid email address';
                                  }
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: TextFormField(
                                style: const TextStyle(height: .15),
                                keyboardType: TextInputType.text,
                                controller: _passwordTextController,
                                decoration: const InputDecoration(
                                  hintText: 'Password',
                                  border: OutlineInputBorder(),
                                ),
                                obscureText: true,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your email';
                                  } else if (value.length < 6) {
                                    return 'Password should contain atleast 6 letter';
                                  }
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: ElevatedButton(
                                child: Container(
                                  // color: Color(0xFFAB47BC),
                                  color: Colors.blue,
                                  height: 40,
                                  width: 130,
                                  child: const Center(
                                    child: Text('Create Account'),
                                  ),
                                ),
                                onPressed: () {
                                  print(_formKey.currentState!.validate());
                                  if (_formKey.currentState!.validate() ==
                                      true) {
                                    _signupBloc.add(
                                      SaveUserDetailsEvent(
                                        name: _nameTextController.value.text,
                                        address:
                                            _addressTextController.value.text,
                                        email: _emailTextController.value.text,
                                        password:
                                            _passwordTextController.value.text,
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: InkWell(
                                child: const Text(
                                  'Already have an account?',
                                  style: TextStyle(fontSize: 18),
                                ),
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    RouteConstants.loginRoute,
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
