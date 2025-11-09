import 'package:flutter/material.dart';
import 'package:kristencrabtree/app/widgets/appbar/custom_app_bar.dart';

class TermsOfServiceScreen extends StatelessWidget {
  const TermsOfServiceScreen({super.key});

  final TextStyle _bodyStyle = const TextStyle(
    color: Color(0xff4A4C56),
    fontSize: 14.0,
    height: 1.5,
  );

  final TextStyle _headingStyle = const TextStyle(
    color: Color(0xff4A4C56),
    fontSize: 14.0,
    fontWeight: FontWeight.bold,
    height: 1.5,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:CustomAppBar(title: 'Terms of Service'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: SafeArea(
          child: RichText(
            text: TextSpan(
              style: _bodyStyle,
              children: <TextSpan>[
                TextSpan(
                  text: 'By using the Dig app, you agree to these terms. You must be at least 13 years old to create and use your account. If you are under 18, you confirm you have parental consent to use the Service. You are responsible for maintaining the confidentiality of your account credentials and for all activities that occur under your account. You agree to provide accurate information during registration and keep it updated.\n\n',
                ),
          
                TextSpan(
                  text: 'Acceptance of Terms\n',
                  style: _headingStyle,
                ),
                TextSpan(
                  text: 'By accessing or using the Dig mobile application and related services (the Service), you agree to be bound by these Terms of Service. If you do not agree to these terms, please do not use our Service.\n\n',
                ),
                TextSpan(
                  text: 'Eligibility and Account Responsibility\n',
                  style: _headingStyle,
                ),
                TextSpan(
                  text: 'You must be at least 13 years old to use Dig. If you are between 13 and 18, you confirm you have parental consent to use our Service. You are responsible for maintaining the confidentiality of your account credentials and for all activities that occur under your account. You agree to provide accurate information during registration and keep it updated.\n\n',
                ),
          
                TextSpan(
                  text: 'User Conduct and Content Guidelines\n',
                  style: _headingStyle,
                ),
                TextSpan(
                  text: 'You retain ownership of the content you create and share on Dig, but you grant us a license to use, display, and share this content through our Service. You are solely responsible for your Content and interaction on the platforms. You agree not to:\n',
                ),
                TextSpan(
                  text: '\n* Post content that is illegal, harmful, threatening, or harassing\n* Share material that infringes on intellectual property rights\n* Engage in spamming or unauthorized promotional activities\n* Impersonate others or provide false information\n* Disrupt the experience of other users\n\n',
                ),
          
                TextSpan(
                  text: 'Our Intellectual Property\n',
                  style: _headingStyle,
                ),
                TextSpan(
                  text: 'The Dig name, logo, application design, and all related proprietary elements are the exclusive property of Paramour Paradox LLC. You may not use our trademarks, logos, or other proprietary information without our express written consent.\n\n',
                ),
          
                TextSpan(
                  text: 'Service Modifications and Termination\n',
                  style: _headingStyle,
                ),
                TextSpan(
                  text: 'We reserve the right to modify, suspend, or discontinue the Service at any time. We may terminate or suspend your access to the Service immediately, without prior notice, for conduct that we believe violates these Terms or is harmful to other users.\n\n',
                ),
          
                TextSpan(
                  text: 'Disclaimer and Limitation of Liability\n',
                  style: _headingStyle,
                ),
                TextSpan(
                  text: 'The Service is provided "as is" without warranties of any kind. We do not guarantee that the Service will be uninterrupted, error-free, or completely secure. Paramour Paradox LLC shall not be liable for any indirect, incidental, or consequential damages arising from your use of the Service.\n\n',
                ),
          
                TextSpan(
                  text: 'Changes to Terms\n',
                  style: _headingStyle,
                ),
                TextSpan(
                  text: 'We may update these Terms from time to time. We will notify users of significant changes through the app or via email. Continued use of the Service after such changes constitutes your acceptance of the new Terms.',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}