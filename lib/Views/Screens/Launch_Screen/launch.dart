import 'package:flutter/material.dart';
import 'package:freshfold_app/Utils/Constants.dart';

import '../Auth/Login/login.dart';
import '../Auth/Signup/signup_screen.dart';

class Launch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.backgroundColor1,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Spacer(),
              Image.asset(
                'assets/logo.png', // Add your logo asset here
                height: 200,
              ),
              const Text(
                'Your Clothes, Our Care',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white54,
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  elevation: 4,
                  backgroundColor: const Color(0xFF00A6FF),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: const Text(
                  'Explore Now',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ));
                },
                style: OutlinedButton.styleFrom(
                  elevation: 4,
                  side: const BorderSide(color: Colors.white54),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: const Text(
                  'Signup',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(text: 'Register as a '),
                    TextSpan(
                      text: 'Client',
                      style: TextStyle(color: Color(0xFF00A6FF)),
                    ),
                    TextSpan(text: ' or as a '),
                    TextSpan(
                      text: 'Employer',
                      style: TextStyle(color: Color(0xFF00A6FF)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'By selecting either option, you agree to the Terms of Service and Privacy Policy.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white54,
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
