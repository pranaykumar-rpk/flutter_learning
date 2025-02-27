import 'package:flutter/material.dart';
import 'package:sample_application/colors.dart';

class TeamAccountTypeWidget extends StatelessWidget {
  final String type;
  final String selectedType;
  final VoidCallback callback;
  const TeamAccountTypeWidget(
      {super.key,
      required this.type,
      required this.selectedType,
      required this.callback});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          callback.call();
          // setState(() {
          //   selectedType = type;
          // });
        },
        child: Container(
            decoration: BoxDecoration(
                color: selectedType == type ? primaryColor : Colors.white,
                borderRadius: BorderRadius.circular(40)),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                type,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: selectedType == type ? Colors.white : Colors.black),
              ),
            )),
      ),
    );
  }
}

class AccountTypeContainer extends StatefulWidget {
  const AccountTypeContainer({super.key});

  @override
  State<AccountTypeContainer> createState() => _AccountTypeContainerState();
}

class _AccountTypeContainerState extends State<AccountTypeContainer> {
  String selectedType = 'Individual';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Color(0xFFE8F0FE),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Choose account type *',
              style: TextStyle(
                  color: Color(0XFF231F20),
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ),
            Wrap(
              children: [
                TeamAccountTypeWidget(
                  type: 'Individual',
                  selectedType: selectedType,
                  callback: () {
                    setState(() {
                      selectedType = 'Individual';
                    });
                  },
                ),
                TeamAccountTypeWidget(
                  type: 'Team Account',
                  selectedType: selectedType,
                  callback: () {
                    setState(() {
                      selectedType = 'Team Account';
                    });
                  },
                ),
                TeamAccountTypeWidget(
                  type: 'Team Organizer',
                  selectedType: selectedType,
                  callback: () {
                    setState(() {
                      selectedType = 'Team Organizer';
                    });
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
