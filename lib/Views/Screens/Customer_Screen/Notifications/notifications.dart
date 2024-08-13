import 'package:flutter/material.dart';
import 'package:freshfold_app/Views/Screens/Bottom_Nav/bottom_navigation.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => bottomNav(),
                ));
          },
        ),
        title: Text(
          'Notification',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          NotificationItem(
            icon: Icons.check_circle,
            iconColor: Colors.green,
            title: 'Your order has been Confirmed',
            subtitle:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod',
            date: '09 Nov',
          ),
          NotificationItem(
            icon: Icons.local_shipping,
            iconColor: Colors.red,
            title: 'Your order picked up',
            subtitle:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod',
            date: '10 Nov',
          ),
          NotificationItem(
            icon: Icons.autorenew,
            iconColor: Colors.orange,
            title: 'Your order In progress',
            subtitle:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod',
            date: '47m ago',
          ),
          NotificationItem(
            icon: Icons.delivery_dining,
            iconColor: Colors.blue,
            title: 'Your order has been Delivered',
            subtitle:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod',
            date: '1h ago',
          ),
          // Repeat as necessary for more notifications
        ],
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final String date;

  NotificationItem({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: iconColor.withOpacity(0.1),
            child: Icon(icon, color: iconColor, size: 28),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
          SizedBox(width: 16),
          Text(
            date,
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
