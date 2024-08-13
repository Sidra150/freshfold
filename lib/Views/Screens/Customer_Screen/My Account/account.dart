import 'package:flutter/material.dart';
import 'package:freshfold_app/Views/Screens/Customer_Screen/Chat/chat.dart';
import 'package:freshfold_app/Views/Screens/Customer_Screen/Home/home.dart';
import 'package:freshfold_app/Views/Screens/Customer_Screen/Membership/plans.dart';
import 'package:freshfold_app/Views/Screens/Customer_Screen/My_Orders/my_orders.dart';
import 'package:freshfold_app/Views/Screens/Customer_Screen/Notifications/notifications.dart';

class MyAccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Navigate back
          },
        ),
        title: const Text(
          'My Account',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Stack(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage("assets/logo.png"),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        // Handle profile picture change
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        padding: const EdgeInsets.all(8),
                        child: const Icon(Icons.camera_alt,
                            color: Colors.white, size: 20),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                'Julien Dupont',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const Text(
                'Julien.dupont@outlook.fr',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 30),
              _buildAccountOption(
                context,
                Icons.person,
                'Membership Information',
                SubscriptionScreen(),
              ),
              _buildAccountOption(
                context,
                Icons.notifications,
                'Notification',
                NotificationPage(),
              ),
              _buildAccountOption(
                context,
                Icons.shopping_bag,
                'My Orders',
                MyOrdersScreen(),
              ),
              _buildAccountOption(
                context,
                Icons.security,
                'Terms & Conditions',
                HomePage(),
              ),
              _buildAccountOption(
                context,
                Icons.help_outline,
                'Help',
                 HomePage(),
              ),
              _buildAccountOption(
                context,
                Icons.group_add,
                'Invite Friends',
                HomePage(),
              ),
              _buildAccountOption(
                context,
                Icons.logout,
                'Log Out',
                HomePage(),
                isLast: true,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAccountOption(
    BuildContext context,
    IconData icon,
    String title,
    Widget screen, {
    bool isLast = false,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: isLast ? 0 : 20),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(0, 4), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.blue),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                title,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
          ],
        ),
      ),
    );
  }
}
