import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remedious/Academic/AcademicEmailVerification.dart';
import 'package:remedious/Academic/AcademicLogin.dart';
import 'package:remedious/Academic/AcademicSignUp.dart';
import 'package:remedious/DataModels/GeneralUser.dart';
import 'package:remedious/General/GeneralEmailVerification.dart';
import 'package:remedious/General/GeneralSignUp.dart';
import 'package:remedious/General/Home.dart';
import 'package:remedious/General/Onboarding.dart';
import 'package:remedious/styles.dart';
import 'package:url_strategy/url_strategy.dart';

import 'General/GeneralLogin.dart';
import 'Landing.dart';

void main() {
  runApp(MyApp());
  setPathUrlStrategy();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            textTheme: GoogleFonts.montserratTextTheme()
        ),
        initialRoute: landingRoute,
        // home:Landing(),
        // routes: {
        //   landingRoute:(context)=>Landing(),
        //
        //   generalLoginRoute:(context)=>GeneralLogin(),
        //   academicLoginRoute:(context)=>AcademicLogin(),
        //
        //   generalSignUpRoute:(context)=>GeneralSignUp(),
        //   academicSignUpRoute:(context)=>AcademicSignUp(),
        //
        //   generalEmailVerificationRoute:(context)=>GeneralEmailVerification(),
        //   academicEmailVerificationRoute:(context)=>AcademicEmailVerification(),
        //
        //   onboardingRoute:(context)=>Onboarding();
        //   generalHomeRoute:(context)=>GeneralHome();
        // },
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case landingRoute:
              return MaterialPageRoute(
                  builder: (context) {
                    return Landing();
                  }
              );
              break;
            case generalLoginRoute:
              return MaterialPageRoute(
                  builder: (context) {
                    return GeneralLogin();
                  }
              );
              break;

            case generalSignUpRoute:
              return MaterialPageRoute(
                  builder: (context) {
                    return GeneralSignUp();
                  }
              );
              break;
            case generalEmailVerificationRoute:
              return MaterialPageRoute(
                  builder: (context) {
                    return GeneralEmailVerification();
                  }
              );
              break;
            case academicLoginRoute:
              return MaterialPageRoute(
                  builder: (context) {
                    return AcademicLogin();
                  }
              );
              break;
            case academicSignUpRoute:
              return MaterialPageRoute(
                  builder: (context) {
                    return AcademicSignUp();
                  }
              );
              break;
            case academicEmailVerificationRoute:
              return MaterialPageRoute(
                  builder: (context) {
                    return AcademicEmailVerification();
                  }
              );
              break;
            case onboardingRoute:
              final GeneralUser user = settings.arguments as GeneralUser;
              return MaterialPageRoute(
                  builder: (context) {
                    return Onboarding(user);
                  }
              );
              break;
            case generalHomeRoute:
              final GeneralUser user = settings.arguments as GeneralUser;
              return MaterialPageRoute(
                  builder: (context) {
                    return GeneralHome(user);
                  }
              );
              break;
            default:
              return MaterialPageRoute(builder: (context) => Landing());
              break;
          }
        }
    );
  }
}