import 'package:csecom/app/view/app.dart';
import 'package:csecom/reset_password/bloc/reset_password_bloc.dart';
import 'package:csecom/router/router_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class ResetPassword extends StatelessWidget {
  ResetPassword({Key? key}) : super(key: key);
  final TextEditingController _emailController =
      TextEditingController(text: '');
  final _formKey = GlobalKey<FormState>();
  final ResetPasswordBloc _resetPasswordBloc = ResetPasswordBloc();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ResetPasswordBloc>(
      create: (context) => _resetPasswordBloc,
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Reset password'),
          ),
          body: BlocConsumer<ResetPasswordBloc, ResetPasswordState>(
            listener: (context, state) {
              if (state is ResetpwdSuccess) {
                Navigator.pushNamed(context, RouteConstants.loginRoute);
                return showTopSnackBar(
                  context,
                  const CustomSnackBar.success(
                    message: 'Please check your email to reset the password',
                  ),
                );
              } else {
                return showTopSnackBar(
                  context,
                  const CustomSnackBar.error(
                    message:
                        'Please ensure that you entered your email correctly',
                  ),
                );
              }
            },
            builder: (context, state) {
              return SafeArea(
                child: Center(
                  child: Container(
                    margin: const EdgeInsets.only(right: 20, left: 20),
                    decoration: const BoxDecoration(
                      color: Colors.white54,
                    ),
                    height: 300.sp,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                              bottom: 10,
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
                                  return 'Please enter your email';
                                } else if (regExp.hasMatch(value) == false) {
                                  return 'Please enter valid email address';
                                }
                                // return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: ElevatedButton(
                              onPressed: () {},
                              child: TextButton(
                                child: const Text(
                                  'Reset',
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () {
                                  if (_formKey.currentState!.validate() ==
                                      false) {
                                    print("reset test");
                                  } else {
                                    _resetPasswordBloc.add(ResetpwdWithEmail(
                                        email: _emailController.text));
                                  }
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          )),
    );
  }
}
