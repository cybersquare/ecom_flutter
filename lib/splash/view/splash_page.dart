import 'dart:developer';
import 'package:csecom/router/router_constants.dart';
import 'package:flutter/material.dart';
import 'package:csecom/splash/splash.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Splash extends StatelessWidget {
  Splash({Key? key}) : super(key: key);
  SplashBloc _splashBloc = SplashBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SplashBloc>(
      create: (context) => _splashBloc..add(SplashStartEvent()),
      child: Scaffold(
        body: BlocConsumer<SplashBloc, SplashState>(
          listener: (context, state) {
            if (state is SplashNavigateToLogin) {
              Navigator.pushNamed(context, RouteConstants.loginRoute);
            } else if (state is SplashNavigateToHomeScreen) {
              Navigator.pushNamed(context, RouteConstants.homeRoute);
            }
          },
          builder: (context, state) {
            return Center(child: Image.asset('assets/images/logo.jpeg'));
          },
        ),
      ),
    );
  }
}
