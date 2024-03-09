import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class IdVerificationScreen extends StatefulWidget {
  const IdVerificationScreen({super.key});

  @override
  _IdVerificationScreenState createState() => _IdVerificationScreenState();
}

class _IdVerificationScreenState extends State<IdVerificationScreen> {

  final String imageSRC = "resources/images/facial_recognition.png";
  final String txt = "La reconnaissance faciale dans les livraisons renforce la sécurité juridique. Elle réduit les erreurs d'identité et les litiges liés aux livraisons en assurant la concordance entre le réceptionnaire et la personne autorisée.";

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
                FacialRecImageWidget(image: imageSRC),
                TextSection(txt: txt),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SetupBTN()
                  ],
                )
              ],
            ),
          ),
        )
    );
  }
}





// ======= FacialRec Image  Widget definition ======= //
class FacialRecImageWidget extends StatelessWidget {
  final String image;

  const FacialRecImageWidget({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      height: 200,
      width: 200,
      errorBuilder: (context, error, stackTrace) {
        // Return a rectangle widget if the image fails to load
        return Container(
          color: Colors.grey,
          child: const Center(
            child: Text('Image non trouvée'),
          ),
        );
      },
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
      padding: const EdgeInsets.all(32),
      child: Text(
        txt,
        style: const TextStyle(
            fontSize: 14,
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
// ========= Setup facial the id btn widget ========= //
class SetupBTN extends StatelessWidget {
  const SetupBTN({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.fromLTRB(32, 0, 32, 32),
      decoration: BoxDecoration(
        color: const Color(0xFF3787C1),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFF3787C1)),
      ),
      child: TextButton(
        onPressed: () {
            Navigator.pushNamed(context, '/id_verification');
        },
        child: const Text(
          "S'identifier",
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
// ========== ============================ ========== //





