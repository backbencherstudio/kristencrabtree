import 'package:flutter/material.dart';
import 'package:kristencrabtree/app/widgets/appbar/custom_app_bar.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  final TextStyle _bodyStyle = const TextStyle(
    color: Color(0xff4A4C56),
    fontSize: 14.0,
    height: 1.5,
  );

  final TextStyle _linkStyle = const TextStyle(
    color: Color(0xffC6A664),
    fontSize: 14.0,
    height: 1.5,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Privacy Policy'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: SafeArea(
          child: RichText(
            text: TextSpan(
              style: _bodyStyle,
              children: <TextSpan>[
                const TextSpan(
                  text: 'We value your privacy and are committed to protecting your personal information. This Privacy & Policy explains what data we collect, how we use it, and your rights as a user.\n\n',
                ),
          
                const TextSpan(
                  text: 'We collect information you provide when creating an account, such as your name, email, and contact details, as well as data related to your activity in the app, including sessions, exercises, and progress tracking. Additionally, we may collect device and usage information, such as app version, device type, and interaction patterns.\n\n',
                ),
          
                const TextSpan(
                  text: 'Your data is used to improve your app experience, personalize recommendations, provide session reminders, and deliver coach feedback. We may also use your information to send relevant updates, offers, and notifications, based on your preferences.\n\n',
                ),
          
                const TextSpan(
                  text: 'We do not sell your data to third parties. Your information may only be shared with trusted service providers to help us operate the app and provide our services. We implement industry-standard security measures to ensure your data remains safe and secure.\n\n',
                ),
          
                const TextSpan(
                  text: 'You have the right to access, correct, or delete your personal data at any time. You can manage your notification and marketing preferences in your account settings or contact our support team regarding your privacy-related questions through ',
                ),
                TextSpan(
                  text: 'support@paramourparadox.com',
                  style: _linkStyle,
                ),
                const TextSpan(
                  text: '.\n\n',
                ),
          
                const TextSpan(
                  text: 'We may use cookies and analytics tools to improve your experience and understand app usage. You can manage your tracking preferences within the app at any time.\n\n',
                ),
          
                const TextSpan(
                  text: 'If you have any questions regarding your privacy or data, please contact our support team at ',
                ),
                TextSpan(
                  text: 'connect@paramourparadox.com',
                  style: _linkStyle,
                ),
                const TextSpan(
                  text: '. Your trust is important to us, and we are committed to keeping your data safe.',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}