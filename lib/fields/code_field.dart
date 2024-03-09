import 'package:flutter/material.dart';
import 'package:flutter_verification_code_field/flutter_verification_code_field.dart';

class CodeVerificationField extends StatelessWidget {

  static bool isCodeValid = false;

  final double left;
  final double top;
  final double right;
  final double bottom;

  const CodeVerificationField({
    super.key,
    required this.left,
    required this.top,
    required this.right,
    required this.bottom
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(left, top, right, bottom),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _CodeInput(),
        ],
      ),
    );
  }
}

class _CodeInput extends StatelessWidget {
  const _CodeInput();

  @override
  Widget build(BuildContext context) {
    return VerificationCodeField(
      length: 5,
      size: const Size(50, 50),
      matchingPattern: RegExp(r'^\d+$'),
      onFilled: (value) {
        CodeVerificationField.isCodeValid = value.isNotEmpty && int.tryParse(value) != null;
      },
    );
  }
}
