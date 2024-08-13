import 'package:flutter/material.dart';

import '../Chat/chat.dart';

class DeliveryStatusScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: Text(
          'Delivery Status',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order ID: 547856',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            _buildStatusItem(
              Icons.check_circle,
              'Order Confirmed',
              'Confirmed on 20 Jun, 11:35 am',
              Colors.green,
              true,
            ),
            _buildStatusItem(
              Icons.check_circle,
              'Pickup Arranged',
              'Make Your Laundry ready to pick',
              Colors.green,
              true,
            ),
            _buildStatusItem(
              Icons.local_laundry_service,
              'Laundry in Process',
              'Your Laundry task is in process.',
              Colors.grey,
              false,
            ),
            _buildStatusItem(
              Icons.local_shipping,
              'Out For Delivery',
              'Your Laundry is out for delivery',
              Colors.orange,
              false,
            ),
            _buildStatusItem(
              Icons.store,
              'Delivered',
              'Your Laundry has been delivered',
              Colors.grey,
              false,
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Delivery Address',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Street West Antapani No 70\nCobleng, Bandung\nJawa Barat, 40134',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage("assets/logo.png"),
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'George Anderson',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Delivery Partner',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.message, color: Colors.blue),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChatScreen(),
                        ));
                  },
                ),
                IconButton(
                  icon: Icon(Icons.phone, color: Colors.blue),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusItem(IconData icon, String title, String subtitle,
      Color color, bool isCompleted) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Column(
            children: [
              Icon(icon, color: color, size: 30),
              if (!isCompleted)
                Container(
                  height: 40,
                  width: 2,
                  color: Colors.grey[300],
                ),
            ],
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              SizedBox(height: 5),
              Text(subtitle,
                  style: TextStyle(color: Colors.grey[600], fontSize: 14)),
            ],
          ),
        ],
      ),
    );
  }
}
