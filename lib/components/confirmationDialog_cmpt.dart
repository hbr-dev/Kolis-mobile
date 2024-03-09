import 'package:flutter/material.dart';

class ConfirmationDialog extends StatelessWidget {
  final String title;
  final String content;
  final Function onConfirm;

  const ConfirmationDialog({
    super.key,
    required this.title,
    required this.content,
    required this.onConfirm
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        TextButton(
          child: const Text('Annuler'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text('Confirmer'),
          onPressed: () {
            onConfirm();
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
