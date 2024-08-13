import 'package:flutter/material.dart';
import 'package:freshfold_app/Views/Screens/Bottom_Nav/bottom_navigation.dart';
import 'package:freshfold_app/Views/Screens/Launch_Screen/launch.dart';

import '../New_password/new_password.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Launch(),
                ));
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
                child: Image(
              image: AssetImage("assets/logo.png"),
              height: 200,
            )),
            const Text(
              "Resume the Adventure",
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              "Log in and discover your favorite laundry services and dry cleaners.",
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 32.0),
            TextField(
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                suffixIcon: const Icon(Icons.visibility_off),
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: false,
                      onChanged: (bool? value) {},
                    ),
                    const Text("Remember me"),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const newPassword(),
                        ));
                  },
                  child: const Text("Forgot password"),
                ),
              ],
            ),
            const SizedBox(height: 30.0),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                elevation: 3,
                foregroundColor: Colors.black,
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                side: const BorderSide(color: Colors.grey),
                minimumSize: const Size(double.infinity, 50.0),
              ),
              child: const Text("Create an account"),
            ),
            const SizedBox(height: 22.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => bottomNav(),
                    ));
              },
              style: ElevatedButton.styleFrom(
                elevation: 3,
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                minimumSize: const Size(double.infinity, 50.0),
              ),
              child: const Text("Login"),
            ),
            const Spacer(),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.g_translate, color: Colors.blue),
                  onPressed: () {},
                ),
                const SizedBox(width: 16.0),
                IconButton(
                  icon: const Icon(Icons.facebook, color: Colors.blue),
                  onPressed: () {},
                ),
                const SizedBox(width: 16.0),
                IconButton(
                  icon: const Icon(Icons.camera_alt, color: Colors.pink),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 32.0),
          ],
        ),
      ),
    );
  }
}
