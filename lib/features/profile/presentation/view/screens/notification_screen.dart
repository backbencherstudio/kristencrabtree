import 'package:flutter/material.dart';
import 'package:kristencrabtree/app/widgets/appbar/custom_app_bar.dart';

import '../../../../../app/widgets/container_button/custom_container.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Notification'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 20,
          children: [
            CustomToggleContainer(
              title: "Meditation Reminders",
              showSwitch: true,
              initialSwitchValue: true,
              onSwitchChanged: (val) {

              },
            ), CustomToggleContainer(
              title: "New Content Alerts",
              showSwitch: true,
              initialSwitchValue: true,
              onSwitchChanged: (val) {

              },
            ), CustomToggleContainer(
              title: "Community Updates",
              showSwitch: true,
              initialSwitchValue: true,
              onSwitchChanged: (val) {

              },
            ), CustomToggleContainer(
              title: "Notification Reminder",
              showSwitch: true,
              initialSwitchValue: true,
              onSwitchChanged: (val) {

              },
            ), CustomToggleContainer(
              title: "Email Updates",
              showSwitch: true,
              initialSwitchValue: true,
              onSwitchChanged: (val) {

              },
            ),


          ],
        ),
      ),
    );
  }
}
