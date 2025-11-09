import 'package:flutter/material.dart';
import 'package:kristencrabtree/app/widgets/appbar/custom_app_bar.dart';
import 'package:kristencrabtree/core/constant/route_names.dart';
import '../../../../../app/widgets/container_button/custom_container.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'About'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 20,
          children: [
            CustomToggleContainer(
              title: "Terms of Service",
              showSwitch: false,
              onArrowTap: () {
                Navigator.pushNamed(context, RouteNames.termsOfServiceScreen);
              },
            ),

            CustomToggleContainer(
              title: "Privacy Policy",
              showSwitch: false,
              onArrowTap: () {
                Navigator.pushNamed(context, RouteNames.privacyPolicyScreen);
              },
            ),

            CustomToggleContainer(
              title: "App Version",
              showText: true,
              rightText: "1.0.0",
            ),
          ],
        ),
      ),
    );
  }
}
