import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csecom/about_us/view/about_us_page.dart';
import 'package:csecom/cart/view/cart.dart';
import 'package:csecom/counter/counter.dart';
import 'package:csecom/home/home.dart';
import 'package:csecom/home/view/widgets/product_detail_widget.dart';
import 'package:csecom/reset_password/reset_password.dart';
import 'package:csecom/router/router_constants.dart';
import 'package:csecom/settings_page/view/settings_page.dart';
import 'package:csecom/signup/view/signup_page.dart';
import 'package:csecom/splash/splash.dart';
import 'package:csecom/viewProfile/viewprofile.dart';
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
      case RouteConstants.homeRoute:
        return MaterialPageRoute<MaterialPageRoute>(
          builder: (_) => Home(),
        );

      case RouteConstants.profileRoute:
        return MaterialPageRoute<MaterialPageRoute>(
          builder: (_) => ViewProfile(),
        );

      case RouteConstants.resetpwdRoute:
        return MaterialPageRoute<MaterialPageRoute>(
          builder: (_) => ResetPassword(),
        );
      case RouteConstants.aboutusRoute:
        return MaterialPageRoute<MaterialPageRoute>(
          builder: (_) => AboutUs(),
        );
      case RouteConstants.settingsRoute:
        return MaterialPageRoute<MaterialPageRoute>(
          builder: (_) => SettingsPage(),
        );
      case RouteConstants.cart:
        return MaterialPageRoute<MaterialPageRoute>(
          builder: (_) => const Cart(),
        );

      default:
        return MaterialPageRoute<MaterialPageRoute>(
          builder: (_) => Splash(),
        );
    }
  }
}
