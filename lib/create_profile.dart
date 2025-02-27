import 'package:flutter/material.dart';
import 'package:sample_application/colors.dart';
import 'package:sample_application/profile_widgets.dart';

class CreateProfile extends StatelessWidget {
  const CreateProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getTitle(),
            SizedBox(
              height: 8,
            ),
            getSubTitle(),
            SizedBox(
              height: 16,
            ),
            AccountTypeContainer(),
            SizedBox(
              height: 20,
            ),
            getButton()
          ],
        ),
      ),
    );
  }

  Widget getTitle() {
    return Text(
      'Setup Profile',
      style: TextStyle(
          color: primaryColor, fontSize: 24, fontWeight: FontWeight.w600),
    );
  }

  Widget getButton() {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
          child: Text(
            'Next',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          )),
    );
  }

  // Widget buildAccountTypeWidget(String type) {
  Widget getSubTitle() {
    return Text(
      'Personalize your profile to unlock a tailored sports experience!',
      style: TextStyle(fontSize: 14, color: Color(0XFF697586)),
    );
  }
}
