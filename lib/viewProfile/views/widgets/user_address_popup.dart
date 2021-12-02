import 'package:csecom/viewProfile/views/widgets/user_text_field.dart';
import 'package:flutter/material.dart';

class UserUpdatePopup extends StatelessWidget {
  UserUpdatePopup({Key? key}) : super(key: key);
  final TextEditingController userNameController =
      TextEditingController(text: 'Surya kiran');
  final TextEditingController userEmailController =
      TextEditingController(text: 'Suryakiran@gmail.com');
  final TextEditingController userPhoneController =
      TextEditingController(text: '+91 8606326406');

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Userprofile update',
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          UserTextFields(
            editingController: userNameController,
            labelText: 'User Name',
          ),
          UserTextFields(
            editingController: userEmailController,
            labelText: 'Email',
          ),
          UserTextFields(
            editingController: userPhoneController,
            labelText: 'Phone no',
          ),
          ElevatedButton(
            child: const Text('Update'),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
