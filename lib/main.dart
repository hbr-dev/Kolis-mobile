import 'package:flutter/material.dart';
import 'package:untitled/screens/idVerification_screen.dart';
import 'package:untitled/screens/inscription_screen.dart';
import 'package:untitled/screens/verification_screen.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/id_verification',
  routes: {
    '/inscription': (context) => const InscriptionScreen(),
    '/phone_verification': (context) => const PhoneVerificationScreen(),
    '/id_verification': (context) => const IdVerificationScreen(),
  },
));
