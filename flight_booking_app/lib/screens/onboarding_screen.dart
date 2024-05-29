import 'package:flutter/material.dart';
import 'sign_in_screen.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Atur latar belakang menjadi putih
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            children: [
              OnboardingPage(
                image: 'assets/images/onboard1.png',
                title: 'Explore\nThe Beautiful\nWorld!',
                description: '',
                buttonText: 'Next',
                onNext: () {
                  _pageController.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.ease,
                  );
                },
              ),
              OnboardingPage(
                image: 'assets/images/onboard2.png',
                title: 'Find\nYour Perfect\nTickets To Fly',
                description: '',
                buttonText: 'Next',
                onNext: () {
                  _pageController.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.ease,
                  );
                },
              ),
              OnboardingPage(
                image: 'assets/images/onboard3.png',
                title: 'Book\nAppointment\nin Easiest Way!',
                description: '',
                buttonText: 'Get Started',
                isLastPage: true,
                onNext: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => SignInScreen()),
                  );
                },
              ),
            ],
          ),
          Positioned(
            left: 16,
            right: 16,
            bottom: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SignInScreen()),
                    );
                  },
                  child: Text(
                    'Skip',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18, // Mengatur ukuran font Skip
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_currentIndex == 2) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => SignInScreen()),
                      );
                    } else {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(
                      _currentIndex == 2 ? 'Get Started' : 'Next',
                      style: TextStyle(fontSize: 18, color: Colors.white), // Mengatur ukuran font Next
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF0064D2), // Mengatur warna sesuai dengan font Next
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final String buttonText;
  final bool isLastPage;
  final VoidCallback onNext;

  OnboardingPage({
    required this.image,
    required this.title,
    required this.description,
    required this.buttonText,
    this.isLastPage = false,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start, // Mengatur tulisan rata kiri
        children: [
          Spacer(),
          Image.asset(
            image,
            height: 401.34, // Mengatur tinggi gambar
            width: 447.62, // Mengatur lebar gambar
            fit: BoxFit.contain,
          ),
          SizedBox(height: 20),
          Text(
            title,
            style: TextStyle(
              fontSize: 40, // Mengatur ukuran teks menjadi 40
              fontWeight: FontWeight.bold,
              fontFamily: 'Inter', // Menggunakan font 'Inter'
              color: Colors.black,
            ),
            textAlign: TextAlign.left, // Mengatur tulisan rata kiri
          ),
          SizedBox(height: 16),
          Text(
            description,
            textAlign: TextAlign.left, // Mengatur tulisan rata kiri
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
