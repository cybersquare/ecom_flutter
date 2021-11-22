import 'package:csecom/counter/counter.dart';
import 'package:csecom/router/router_constants.dart';
import 'package:csecom/signup/view/signup_page.dart';
import 'package:csecom/splash/splash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:csecom/login/login.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings route) {
    switch (route.name) {
      case RouteConstants.splashRoute:
        return MaterialPageRoute<MaterialPageRoute>(
          builder: (_) => Splash(),
        );

      case RouteConstants.counterRoute:
        return MaterialPageRoute<MaterialPageRoute>(
          builder: (_) => const CounterPage(),
        );

      case RouteConstants.loginRoute:
        return MaterialPageRoute<MaterialPageRoute>(
          builder: (_) => Login(),
        );

      case RouteConstants.signupRoute:
        return MaterialPageRoute<MaterialPageRoute>(
          builder: (_) => SignUp(),
        );

      default:
        return MaterialPageRoute<MaterialPageRoute>(
          builder: (_) => Splash(),
        );
    }
  }
}