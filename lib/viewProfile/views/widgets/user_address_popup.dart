import 'package:csecom/viewProfile/bloc/viewprofile_bloc.dart';
import 'package:csecom/viewProfile/views/widgets/user_text_field.dart';
import 'package:flutter/material.dart';

class UserUpdatePopup extends StatelessWidget {
  UserUpdatePopup({
    Key? key,
    required this.userName,
    required this.email,
    required this.phoneNo,
    required this.viewprofileBloc,
  }) : super(key: key);
  TextEditingController userName;
  TextEditingController email;
  TextEditingController phoneNo;

  // final TextEditingController userNameController =
  //     TextEditingController(text: 'Surya kiran');
  // final TextEditingController userEmailController =
  //     TextEditingController(text: 'Suryakiran@gmail.com');
  // final TextEditingController userPhoneController =
  //     TextEditingController(text: '+91 8606326406');
  ViewprofileBloc viewprofileBloc;

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
            editingController: userName,
            labelText: 'User Name',
          ),
          UserTextFields(
            editingController: email,
            labelText: 'Email',
          ),
          UserTextFields(
            editingController: phoneNo,
            labelText: 'Phone no',
          ),
          ElevatedButton(
            child: const Text('Update'),
            onPressed: () {
              viewprofileBloc.add(
                UserUpdateEvent(
                  userName: userName.text,
                  email: email.text,
                ),
              );
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }
}
