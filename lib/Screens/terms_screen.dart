import 'package:flutter/material.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // The leading property defines the widget to display before the toolbar's title.
        // It is often used to display a back button.
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Terms & Conditions'),
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            //TODO: Add terms and conditions to a markdown file and display it here.
            "Last updated: 08/07/2023\n\nPlease read these terms and conditions carefully before using Our Service.\n\nInterpretation and Definitions\n\nInterpretation\nThe words of which the initial letter is capitalized have meanings defined under the following conditions. The following definitions shall have the same meaning regardless of whether they appear in singular or in plural.\n\nDefinitions\nFor the purposes of these Terms and Conditions:\n\n- \"You\" means the individual accessing or using the Service, or the company, or other legal entity on behalf of which such individual is accessing or using the Service, as applicable.\n- \"Company\" (referred to as either \"the Company\", \"We\", \"Us\" or \"Our\" in this Agreement) refers to [Your Company Name], [Your Company Address].\n- \"Service\" refers to the Application.\n- \"Application\" means the software program provided by the Company downloaded by You on any electronic device.\n\nAcknowledgment\nThese are the Terms and Conditions governing the use of this Service and the agreement that operates between You and the Company. These Terms and Conditions set out the rights and obligations of all users regarding the use of the Service.\n\nBy accessing or using the Service You agree to be bound by these Terms and Conditions. If You disagree with any part of these Terms and Conditions then You may not access the Service.\n\nUser Accounts\nWhen You create an account with Us, You must provide Us information that is accurate, complete, and current at all times. Failure to do so constitutes a breach of the Terms, which may result in immediate termination of Your account on Our Service.\n\nTermination\nWe may terminate or suspend Your Account immediately, without prior notice or liability, for any reason whatsoever, including without limitation if You breach these Terms and Conditions.\n\nLimitation of Liability\nNotwithstanding any damages that You might incur, the entire liability of the Company and any of its suppliers under any provision of this Terms and Your exclusive remedy for all of the foregoing shall be limited to the amount actually paid by You through the Service.\n\n\"AS IS\" and \"AS AVAILABLE\" Disclaimer\nThe Service is provided to You \"AS IS\" and \"AS AVAILABLE\" and with all faults and defects without warranty of any kind.\n\nGoverning Law\nThe laws of the Country, excluding its conflicts of law rules, shall govern this Terms and Your use of the Service.\n\nChanges to These Terms and Conditions\nWe reserve the right, at Our sole discretion, to modify or replace these Terms at any time.\n",
          ),
        ),
      ),
    );
  }
}
