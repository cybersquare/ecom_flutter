import 'package:csecom/counter/counter.dart';
import 'package:csecom/router/router_constants.dart';
import 'package:csecom/splash/splash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings route) {
    switch (route.name) {
      case RouteConstants.splashRoute:
        return MaterialPageRoute<MaterialPageRoute>(
          builder: (_) => const Splash(),
        );

      case RouteConstants.counterRoute:
        return MaterialPageRoute<MaterialPageRoute>(
          builder: (_) => const CounterPage(),
        );

      default:
        return MaterialPageRoute<MaterialPageRoute>(
          builder: (_) => const Splash(),
        );
    }
  }
}
