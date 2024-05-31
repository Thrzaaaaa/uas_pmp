import 'package:flutter/material.dart';
import 'screens/onboarding_screen.dart';


//halo thirza
// diego
void main() {
  runApp(FlightBookingApp());
}

class FlightBookingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flight Booking App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OnboardingScreen(),
      debugShowCheckedModeBanner: false,  // Tambahkan baris ini
    );
  }
}
