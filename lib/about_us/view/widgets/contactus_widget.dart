import 'package:flutter/material.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        child: Container(
          color: Colors.white60,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Contact Us',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.purple,
                  ),
                ),
              ),
              Divider(),
              ListTile(
                leading: const Icon(
                  Icons.home,
                  color: Colors.purple,
                ),
                title: const Text('Cyber Square'),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    'Door No: 1507, 5th Floor, Cafit Square Hilite Business Park, Hilite City, Kozhikode, Kerala 673014, India',
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ),
              ),
              Divider(),
              ListTile(
                leading: const Icon(
                  Icons.phone,
                  color: Colors.purple,
                ),
                title: Text(
                  ' 80861 13399',
                  style: TextStyle(color: Colors.black.withOpacity(0.6)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
