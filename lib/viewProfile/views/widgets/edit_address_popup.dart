import 'package:csecom/viewProfile/bloc/viewprofile_bloc.dart';
import 'package:csecom/viewProfile/views/widgets/user_text_field.dart';
import 'package:flutter/material.dart';

class EditAddressPopup extends StatelessWidget {
  EditAddressPopup(
      {Key? key,
      required this.addressController,
      required this.viewProfileBloc})
      : super(key: key);
  TextEditingController addressController =
      TextEditingController(text: 'Baabte system technologies, cafit square');
  final TextEditingController placeController = TextEditingController(text: '');
  final TextEditingController districtController =
      TextEditingController(text: 'Calicut');
  final TextEditingController stateController =
      TextEditingController(text: 'Kerala');

  ViewprofileBloc viewProfileBloc;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Change your address'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          UserTextFields(
            editingController: addressController,
            labelText: 'Adress',
          ),
          ElevatedButton(
            child: const Text('Update'),
            onPressed: () {
              viewProfileBloc.add(
                UserAdressUpdateEvent(
                  adress: addressController.text,
                ),
              );
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
