import 'package:csecom/home/home.dart';
import 'package:flutter/material.dart';

class ProdductDisplay extends StatefulWidget {
  ProdductDisplay({Key? key, required this.data}) : super(key: key);
  Products data;

  @override
  _ProdductDisplayState createState() => _ProdductDisplayState();
}

class _ProdductDisplayState extends State<ProdductDisplay> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.1,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(widget.data.picture.toString(), fit: BoxFit.fill),
            ListTile(
              title: Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.data.title.toString(),
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: FlatButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.favorite,
                        color: Colors.pink,
                      ),
                    ),
                  ),
                ],
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    widget.data.description.toString(),
                  ),
                  Text(
                    widget.data.price.toString(),
                    style: TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
