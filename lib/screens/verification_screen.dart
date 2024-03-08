import 'dart:async';

import 'package:flutter/material.dart';
import 'package:untitled/fields/code_field.dart';

class PhoneVerificationScreen extends StatefulWidget {
  const PhoneVerificationScreen({super.key});

  @override
  _PhoneVerificationScreenState createState() =>
      _PhoneVerificationScreenState();
}

class _PhoneVerificationScreenState extends State<PhoneVerificationScreen> {
  final String imageSRC = "resources/images/sms_imgD.png";
  final String txt = "Taper le code de vérification";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SMSImageWidget(image: imageSRC),
              TextSection(txt: txt),
              const FormSection(),
            ],
          ),
        ),
      ),
    );
  }
}

// ========== SMS Image  Widget definition ========== //
class SMSImageWidget extends StatelessWidget {
  final String image;

  const SMSImageWidget({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 300,
      child: Image.asset(
        image,
        // fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          // Return a rectangle widget if the image fails to load
          return Container(
            color: Colors.grey,
            child: const Center(
              child: Text('Image non trouvée'),
            ),
          );
        },
      ),
    );
  }
}

// ========== ============================ ========== //
// ============= Text Widget definition ============= //
class TextSection extends StatelessWidget {
  final String txt;

  const TextSection({super.key, required this.txt});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 32, 0, 10),
      child: Text(
        txt,
        style: const TextStyle(
            fontSize: 18,
            fontFamily: 'zeqreg',
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
            color: Color(0xFF8F8F8F)),
        textAlign: TextAlign.center,
        softWrap: true,
      ),
    );
  }
}

// ========== ============================ ========== //
// ============= ==== Form Section ==== ============= //
// ---- Form main
class FormSection extends StatelessWidget {
  const FormSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 0, 32, 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const CodeVerificationField(left: 0, top: 0, right: 0, bottom: 32),
          ResendSection(),
          const SubmitBTN()
        ],
      ),
    );
  }
}

// ---- Resend Section
class ResendSection extends StatelessWidget {
  final TimerModel timerModel = TimerModel();

  ResendSection({super.key});

  @override
  Widget build(BuildContext context) {
    timerModel.startTimer();
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () {
                timerModel.resetTimer();
            },
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.pressed)) {
                  return Colors.transparent;
                }
                return null;
              }),
            ),
            child: ValueListenableBuilder<int>(
              valueListenable: timerModel.timeNotifier,
              builder: (context, value, _) {
                return Text(
                  "Renvoyer:",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'zeqreg',
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                    color: value == 0 ? const Color(0xFF3787C1) : Colors.red,
                    decoration: TextDecoration.underline,
                    decorationColor:
                    value == 0 ? const Color(0xFF3787C1) : Colors.red,
                    decorationThickness: 2.0,
                  ),
                  textAlign: TextAlign.center,
                );
              }
            ),
          ),
          ValueListenableBuilder<int>(
            valueListenable: timerModel.timeNotifier,
            builder: (context, value, _) {
              return Text(
                "$value s",
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'zeqreg',
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                    color: Color(0xFF8F8F8F)),
              );
            },
          ),
        ],
      ),
    );
  }
}

class TimerModel {
  ValueNotifier<int> timeNotifier = ValueNotifier<int>(60);

  void startTimer() {
    Future.doWhile(() async {
      await Future.delayed(const Duration(seconds: 1));
      timeNotifier.value--;
      if (timeNotifier.value == 0) {
        return false;
      }
      return true;
    });
  }

  void resetTimer() {
    timeNotifier.value = 60;
  }
}

// ---- Submit btn
class SubmitBTN extends StatelessWidget {
  const SubmitBTN({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: const Color(0xFF3787C1),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFF3787C1)),
      ),
      child: TextButton(
        onPressed: () {
          // if ( PhoneFieldView.isValidPhoneNBR && PasswordFieldView.isValidPWD ) {
          //   Navigator.pushNamed(context, '/phone_verification');
          // } else {
          //   print("Form is not valid!");
          // }
        },
        child: const Text(
          'Vérifier',
          style: TextStyle(
            fontSize: 18,
            fontFamily: 'zeqreg',
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
// ============= ====================== ============= //
