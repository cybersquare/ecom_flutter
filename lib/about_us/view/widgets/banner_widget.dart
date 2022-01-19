import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            color: Colors.indigo[100],
            child: Expanded(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Who We Are',
                    style: TextStyle(
                      fontSize: 20,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 1.2
                        ..color = Colors.black87,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Image.asset('assets/images/kidsfasionbanner.jfif')
        ],
      ),
    );
  }
}
