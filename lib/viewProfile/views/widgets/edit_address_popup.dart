import 'package:csecom/viewProfile/views/widgets/user_text_field.dart';
import 'package:flutter/material.dart';

class EditAddressPopup extends StatelessWidget {
  EditAddressPopup({Key? key}) : super(key: key);
  final TextEditingController addressController =
      TextEditingController(text: 'Baabte system technologies, cafit square');
  final TextEditingController placeController =
      TextEditingController(text: 'Hilite Business Park');
  final TextEditingController districtController =
      TextEditingController(text: 'Calicut');
  final TextEditingController stateController =
      TextEditingController(text: 'Kerala');

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
          // UserTextFields(
          //   editingController: placeController,
          //   labelText: 'Place',
          // ),
          // UserTextFields(
          //   editingController: districtController,
          //   labelText: 'District',
          // ),
          // UserTextFields(
          //   editingController: stateController,
          //   labelText: 'State',
          // ),
          ElevatedButton(
            child: const Text('Update'),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
