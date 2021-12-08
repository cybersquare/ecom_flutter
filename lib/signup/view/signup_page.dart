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
      TextEditingController(text: "");
  final TextEditingController _addressTextController =
      TextEditingController(text: '');
  final TextEditingController _emailTextController =
      TextEditingController(text: "");
  final TextEditingController _passwordTextController =
      TextEditingController(text: "");
  final SignupBloc _signupBloc = SignupBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignupBloc>(
      create: (context) => _signupBloc,
      child: BlocConsumer<SignupBloc, SignupState>(
        listener: (context, state) {
          if (state is NavigateToLogin) {
            Navigator.pushNamed(context, RouteConstants.profileRoute);
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
                      'Registeration Failed! Please check your entered credentials are correct',
                ),
              );
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: SingleChildScrollView(
              child: Container(
                margin:
                    EdgeInsets.only(top: .30.sw, right: .05.sw, left: .05.sw),
                decoration: BoxDecoration(
                  color: Colors.white54,
                  border: Border.all(color: Colors.black12),
                ),
                height: 560.sp,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Image.asset(
                        'assets/images/cs_ecom_logo.png',
                        height: 60.sp,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 30, bottom: 20),
                      child: Text(
                        'signup',
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
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
                      child: TextField(
                        style: const TextStyle(height: 1),
                        keyboardType: TextInputType.multiline,
                        maxLines: 2,
                        controller: _addressTextController,
                        decoration: const InputDecoration(
                          hintText: 'Address',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        style: const TextStyle(height: .15),
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailTextController,
                        decoration: const InputDecoration(
                          hintText: 'Email',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        style: const TextStyle(height: .15),
                        keyboardType: TextInputType.text,
                        controller: _passwordTextController,
                        decoration: const InputDecoration(
                          hintText: 'Password',
                          border: OutlineInputBorder(),
                        ),
                        obscureText: true,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
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
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
