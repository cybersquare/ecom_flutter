import 'package:csecom/about_us/about_us.dart';
import 'package:csecom/about_us/view/widgets/company_description.dart';
import 'package:csecom/about_us/view/widgets/contactus_widget.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);
//introduction,faqs, app feed back, privacy policy, terms of use, contact us
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About us'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BannerWidget(),
            CompanyDescription(),
            ContactUs(),
          ],
        ),
      ),
    );
  }
}
