import 'package:flutter/material.dart';
import 'package:phone_form_field/phone_form_field.dart';

class PhoneFieldView extends StatelessWidget {

  final FocusNode focusNode;
  final bool withLabel;
  final bool isCountryButtonPersistant;
  final bool mobileOnly;
  final bool useRtl;

  static bool isValidPhoneNBR = false;

  const PhoneFieldView({
    super.key,
    required this.focusNode,
    required this.withLabel,
    required this.isCountryButtonPersistant,
    required this.mobileOnly,
    required this.useRtl,
  });


  PhoneNumberInputValidator? _getValidator(BuildContext context) {
    List<PhoneNumberInputValidator> validators = [];
    if (mobileOnly) {
      validators.add(PhoneValidator.validMobile(context));
    } else {
      validators.add(PhoneValidator.valid(context));
    }
    return validators.isNotEmpty ? PhoneValidator.compose(validators) : null;
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      child: PhoneFormField(
        flagSize: 32,
        initialValue: const PhoneNumber(
          isoCode: IsoCode.TN,
          nsn: ''
        ),
        isCountryButtonPersistent: isCountryButtonPersistant,
        autofocus: false,
        autofillHints: const [AutofillHints.telephoneNumber],
        countrySelectorNavigator: const CountrySelectorNavigator.dialog(countries: [IsoCode.FR, IsoCode.TN]),
        decoration: InputDecoration(
          label: withLabel ? const Text('Téléphone') : null,
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFF8F8F8F)
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
            color: Color(0xFF3787C1),
            ),
          ),
          hintText: withLabel ? '' : 'Téléphone',
        ),
        style: const TextStyle(
          fontSize: 18,
          fontFamily: 'zeqreg',
        ),
        enabled: true,
        showIsoCodeInInput: false,
        showFlagInInput: true,
        keyboardType: TextInputType.phone,
        validator: _getValidator(context),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onChanged: (value) {
          PhoneFieldView.isValidPhoneNBR = value.isValid();
        },
      ),
    );
  }
}

