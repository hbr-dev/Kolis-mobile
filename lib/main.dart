import 'package:flutter/material.dart';
import 'package:untitled/screens/inscription_screen.dart';
import 'package:untitled/screens/verification_screen.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/phone_verification',
  routes: {
    '/phone_verification': (context) => const PhoneVerificationScreen(),
    '/signup': (context) => const InscriptionScreen(),
  },
));
