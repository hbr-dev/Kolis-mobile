import 'package:flutter/material.dart';
import 'package:phone_form_field/phone_form_field.dart';
import 'package:untitled/fields/phone_field.dart';
import 'package:untitled/fields/pwd_field.dart';

class InscriptionPage extends StatefulWidget {
  const InscriptionPage({super.key});

  @override
  _InscriptionPageState createState() => _InscriptionPageState();
}





class _InscriptionPageState extends State<InscriptionPage> {

  final String image_src = "resources/images/logo_color.png";
  final String txt = "Vous recevrez une vérification du code à 5 chiffres sur ce numéro de téléphone";

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
              LogoSection(image: image_src),
              TextSection(txt: txt),
              FormSection(),
            ],
          ),
        ),
      )
    );
  }
}





// ============= Logo Widget definition ============= //
class LogoSection extends StatelessWidget{

  final String image;

  const LogoSection({
    super.key,
    required this.image
  });
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 300,
      child: Image.asset(
        image,
        fit: BoxFit.cover,
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
// ============= ====================== ============= //
// ============= Text Widget definition ============= //
class TextSection extends StatelessWidget{

  final String txt;

  const TextSection({
    super.key,
    required this.txt
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 32, 0, 32),
      child: Text(
        txt,
        style: const TextStyle(
          fontSize: 18,
          fontFamily: 'zeqreg',
          fontWeight: FontWeight.bold,
          letterSpacing: 1.5,
          color: Color(0xFF8F8F8F)
        ),
        textAlign: TextAlign.center,
        softWrap: true,
      ),
    );
  }
}
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
          PhoneNBRField(),
          const PasswordField(),
          const SubmitBTN()
        ],
      ),
    );
  }
}
// ---- PhoneNumber Field
class PhoneNBRField extends StatelessWidget {

  final FocusNode focusNode = FocusNode();

  bool mobileOnly = true;
  bool isCountryButtonPersistent = true;
  bool withLabel = true;
  bool useRtl = false;

  PhoneNBRField({super.key});

  @override
  Widget build(BuildContext context) {
    return PhoneFieldView(
        focusNode: focusNode,
        withLabel: withLabel,
        isCountryButtonPersistant: isCountryButtonPersistent,
        mobileOnly: mobileOnly,
        useRtl: useRtl
    );
  }

}
// ---- Password field
class PasswordField extends StatelessWidget {
  const PasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    return const PasswordFieldView();
  }

}
// ============= ====================== ============= //
// ========== SubmitBTN Wid_get definition ========== //
class SubmitBTN extends StatelessWidget {

  const SubmitBTN({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: const Color(0xFF3787C1),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.blue),
      ),
      child: TextButton(
        onPressed: () {
          if ( PhoneFieldView.isValidPhoneNBR && PasswordFieldView.isValidPWD ) {
            print("Form is valid!");
          } else {
            print("Form is not valid!");
          }
        },
        child: const Text(
          'Continuer',
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


