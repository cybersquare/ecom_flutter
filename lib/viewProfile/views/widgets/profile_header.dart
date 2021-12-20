import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  ProfileHeader({
    Key? key,
    required this.email,
    required this.name,
    required this.mob,
  }) : super(key: key);
  String email;
  String name;
  String mob;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: MediaQuery.of(context).size.width / 10,
          backgroundImage: const NetworkImage(
            'https://res.cloudinary.com/demo/image/facebook/65646572251.jpg',
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              Text(
                email,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              Text(
                mob,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
