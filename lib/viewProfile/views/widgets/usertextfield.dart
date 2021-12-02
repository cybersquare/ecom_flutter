import 'package:flutter/material.dart';

class UserTextFields extends StatelessWidget {
  UserTextFields({
    Key? key,
    required this.editingController,
    required this.labelText,
  }) : super(key: key);
  TextEditingController editingController;
  String labelText;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        controller: editingController,
        keyboardType: TextInputType.multiline,
        decoration: InputDecoration(
          labelText: labelText,
        ),
      ),
    );
  }
}
