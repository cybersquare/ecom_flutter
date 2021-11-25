import 'package:csecom/login/login.dart';
import 'package:csecom/login/view/widget/login_elements.dart';
import 'package:csecom/router/router_constants.dart';
import 'package:csecom/signup/view/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  LoginBloc _loginBloc = LoginBloc();

  @override
  Widget build(BuildContext context) {
    // return BlocProvider<LoginBloc>(
    //   create: (context) => _loginBloc,
    //   child: BlocConsumer<LoginBloc, LoginState>(
    //     listener: (context, state) {},
    //     builder: (context, state) {
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
      body: SafeArea(
        child: Container(
            margin: EdgeInsets.only(top: 60, right: 20, left: 20),
            // decoration: Decoration,
            decoration: BoxDecoration(
              color: Colors.white54,
              border: Border.all(color: Colors.black12),
            ),
            height: 540,
            child: LoginElements()),
      ),
    );
  }
}
