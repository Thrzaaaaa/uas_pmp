import 'package:flutter/material.dart';
import 'sign_up_screen.dart';
import 'home_screen.dart';
import 'onboarding_screen.dart'; // Import halaman onboarding untuk navigasi kembali

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Mengatur latar belakang menjadi putih
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => OnboardingScreen()), // Kembali ke halaman onboarding
                  );
                },
                padding: EdgeInsets.only(left: 1), // Menambahkan margin kiri pada IconButton
                alignment: Alignment.centerLeft, // Mengatur posisi ikon ke kiri
                constraints: BoxConstraints.tightFor(width: 40), // Mengurangi lebar IconButton
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(top: 8.0), // Menambahkan padding di bagian atas teks
                child: Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0), // Mengubah warna font menjadi hitam
                  ),
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
              TextField(
                decoration: InputDecoration(
                  labelText: 'EMAIL',
                  labelStyle: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                  hintText: 'Enter Your Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'PASSWORD',
                  labelStyle: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                  hintText: 'Enter Your Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle sign in logic
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(
                      'Sign In',
                      style: TextStyle(color: Colors.white), // Mengubah warna font menjadi putih
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF0064D2), // Ubah warna tombol
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  'Or Sign In With',
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
                        // Handle Facebook sign in
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
                        // Handle Google sign in
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
                        // Handle Apple sign in
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account?',
                      style: TextStyle(color: const Color.fromARGB(255, 96, 95, 95)),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(color: Color.fromARGB(255, 0, 100, 255)), // Ubah warna teks menjadi biru
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
