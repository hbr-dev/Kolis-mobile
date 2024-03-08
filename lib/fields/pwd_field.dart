import 'package:flutter/material.dart';
import 'package:passwordfield/passwordfield.dart';

class PasswordFieldView extends StatelessWidget {

  const PasswordFieldView({super.key});

  static bool isValidPWD = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 32),
      child: PasswordField(
        maxLength: 10,
        controller: TextEditingController(text: ''),
        errorMessage:
        '''
        - Au moins 6 caractères 
        - Au moins un caractère spécial
        - Au moins un caractère majuscule
        - Un chiffre
        ''',
        passwordConstraint: r'^(?=.*[0-9])(?=.*[!@#\$%^&*()])(?=.*[A-Z]).{6,}$',
        passwordDecoration: PasswordDecoration(
          inputPadding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
          suffixIcon: const Icon(
            Icons.remove_red_eye,
            color: Color(0xFF8F8F8F),
          ),
          inputStyle: const TextStyle(
            fontSize: 18,
            fontFamily: "zeqreg",
          ),
        ),
        hintText: 'Mot de passe',
        border: PasswordBorder(
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFF8F8F8F),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFF3787C1),
            )
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide:
            BorderSide(width: 2, color: Colors.red.shade200),
          ),
        ),
        onChanged: (pwd) {
          if(RegExp(r"^(?=.*[0-9])(?=.*[!@#\$%^&*()])(?=.*[A-Z]).{6,}$").hasMatch(pwd)){
            PasswordFieldView.isValidPWD = true;
          } else {
            PasswordFieldView.isValidPWD = false;
          }
        },
      ),
    );
  }
}
