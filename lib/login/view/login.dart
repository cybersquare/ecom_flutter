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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Container(
            margin: EdgeInsets.only(right: 20, left: 20),
            decoration: BoxDecoration(
              color: Colors.white54,
              border: Border.all(color: Colors.black12),
            ),
            height: 560.sp,
            child: LoginElements(),
          ),
        ),
      ),
    );
  }
}
