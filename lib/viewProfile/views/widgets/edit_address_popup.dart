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
          TextField(
            keyboardType: TextInputType.multiline,
            decoration: const InputDecoration(
              label: Text('Address'),
            ),
            controller: addressController,
          ),
          TextField(
            keyboardType: TextInputType.multiline,
            decoration: const InputDecoration(
              label: Text('Place'),
            ),
            controller: placeController,
          ),
          TextField(
            keyboardType: TextInputType.multiline,
            decoration: const InputDecoration(
              label: Text('District'),
            ),
            controller: districtController,
          ),
          TextField(
            keyboardType: TextInputType.multiline,
            decoration: const InputDecoration(
              label: Text('State'),
            ),
            controller: stateController,
          ),
          ElevatedButton(
            child: const Text("Update"),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
