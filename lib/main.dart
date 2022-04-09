import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:personaltracking/feature/loginPage/view/login_view.dart';
import 'package:personaltracking/feature/registerPage/view/register_view.dart';

import 'feature/allowingformPage/view/allowingpageview.dart';
import 'feature/profilepage/view/profilepageview.dart';
import 'feature/scannerpage/view/scannerpage.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
        routes: {
          "/": (context) => const LoginView(),
        },

        onGenerateRoute: (settings) {
          List<String> filtered = settings.name!.split("/");
          switch (filtered[1]) {
            case "profilePage":
              return PageTransition(
                child: const ProfilePage(),
                type: PageTransitionType.fade,
                settings: settings,
                reverseDuration: const Duration(seconds: 0),
              );
              case "scannerPage":
              return PageTransition(
                child: const QrScannerPage(),
                type: PageTransitionType.fade,
                settings: settings,
                reverseDuration: const Duration(seconds: 0),
              );

                case "registerPage":
              return PageTransition(
                child: const RegisterView(),
                type: PageTransitionType.fade,
                settings: settings,
                reverseDuration: const Duration(seconds: 0),
              );

              case "loginPage":
              return PageTransition(
                child: const LoginView(),
                type: PageTransitionType.fade,
                settings: settings,
                reverseDuration: const Duration(seconds: 0),
              );
          
          }
          return null;
        
  }
    );
  }
}


