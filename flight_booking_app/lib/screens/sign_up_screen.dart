import 'package:flutter/material.dart';
import 'sign_in_screen.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Start Your Journey with affordable price',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 30),
              CustomTextField(label: 'EMAIL'),
              SizedBox(height: 20),
              CustomTextField(label: 'PASSWORD', obscureText: true),
              SizedBox(height: 20),
              CustomTextField(label: 'CONFIRM PASSWORD', obscureText: true),
              SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle sign up logic
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.white), // Mengubah warna font menjadi putih
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF0064D2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  'Or Sign Up With',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 98.33,
                    height: 64,
                    decoration: BoxDecoration(
                      color: Color(0xFFF2F3F6),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: IconButton(
                      icon: Image.asset('assets/images/Facebook.png'),
                      onPressed: () {
                        // Handle Facebook sign up
                      },
                    ),
                  ),
                  SizedBox(width: 16),
                  Container(
                    width: 98.33,
                    height: 64,
                    decoration: BoxDecoration(
                      color: Color(0xFFF2F3F6),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: IconButton(
                      icon: Image.asset('assets/images/Google.png'),
                      onPressed: () {
                        // Handle Google sign up
                      },
                    ),
                  ),
                  SizedBox(width: 16),
                  Container(
                    width: 98.33,
                    height: 64,
                    decoration: BoxDecoration(
                      color: Color(0xFFF2F3F6),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: IconButton(
                      icon: Image.asset('assets/images/Apple.png'),
                      onPressed: () {
                        // Handle Apple sign up
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignInScreen()));
                  },
                  child: RichText(
                    text: TextSpan(
                      text: 'Already have an account? ',
                      style: TextStyle(color: Colors.grey),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Sign In',
                          style: TextStyle(color: Color(0xFF0064D2)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
