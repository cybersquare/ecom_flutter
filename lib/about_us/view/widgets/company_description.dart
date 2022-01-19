import 'package:flutter/material.dart';

class CompanyDescription extends StatelessWidget {
  const CompanyDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      color: Colors.cyan.shade800,
      child: const Padding(
        padding: EdgeInsets.all(20),
        child: Text(
          'CSECOM is an Indian e-commerce company, headquartered in Calicut, Kerala, India, is a private limited company. The company initially focused on online book sales before expanding into other product categories such as consumer electronics, fashion, home essentials, groceries, and lifestyle products.The service competes primarily with Cybersquare Indian subsidiary and domestic rival Snapdeal.As of March 2017, CSECOM held a 15% market share of India\'s e-commerce industry.CSECOM has a dominant position in the apparel segment, bolstered by its acquisition of Cybersquare',
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
      ),
    );
  }
}
