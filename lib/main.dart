import 'package:doctors/screens/booking.dart';
import 'package:doctors/screens/booksuccess.dart';
import 'package:flutter/material.dart';
import 'package:doctors/main_layout.dart';
import 'package:doctors/screens/auth.dart';
import 'package:doctors/screens/doctorsdetails.dart';
import 'package:doctors/utils/config.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // this is for push navigator
  static final navigatorKey = GlobalKey<NavigatorState>();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // define ThemeData Here
    return MaterialApp(
      title: 'Kairos Doctor App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       inputDecorationTheme: const InputDecorationTheme (
        focusColor: Config.primaryColor,
         border: Config.outlinedBorder,
         focusedBorder: Config.outlinedBorder,
         errorBorder: Config.errorBorder,
         enabledBorder: Config.outlinedBorder,
         floatingLabelStyle: TextStyle(color: Config.primaryColor),
         prefixIconColor: Colors.black38
       ),
        scaffoldBackgroundColor: Colors.white,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Config.primaryColor,
          selectedItemColor: Colors.white,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          elevation: 10,
          type: BottomNavigationBarType.fixed,
        )
      ),
      initialRoute: '/',
      routes: {
        // this is initial route of the app

        '/':(context)=>const AuthPage(),
        // this is auth page (login and sign up)
        'main': (context)=> const MainLayout(),
        'doctorsdetails':(context)=>const DoctorDetails(), // Navigates to doctors details page
        'booking':(context) => const Booking(),
        'booksuccess':(context) => const AppointmentBooked(),
        
      },
      // home: const MyHomePage(),
    );
  }
}

