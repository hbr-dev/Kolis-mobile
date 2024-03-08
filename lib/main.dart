import 'package:flutter/material.dart';
import 'package:untitled/screens/inscription.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/signup',
  routes: {
    '/signup': (context) => const InscriptionPage(),
  },
));
