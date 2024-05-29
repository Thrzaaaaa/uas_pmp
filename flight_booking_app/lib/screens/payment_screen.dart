import 'package:flutter/material.dart';
import 'confirmation_screen.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';

class PaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Payment')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextField(label: 'Card Number'),
            CustomTextField(label: 'Expiry Date'),
            CustomTextField(label: 'CVV', obscureText: true),
            SizedBox(height: 20),
            CustomButton(
              text: 'Pay Now',
              onPressed: () {
                // Handle payment logic
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ConfirmationScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
