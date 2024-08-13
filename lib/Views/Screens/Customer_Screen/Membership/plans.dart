import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SubscriptionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Membership',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.close, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome to Our Subscription Service!',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Choose a plan, manage your subscription, and enjoy hassle-free service with just a few clicks.',
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
              SizedBox(height: 30),
              _buildPlanOption('Basic Plan', '10 Pickups\nReal Time\nEmail',
                  '\$9.99/Month', false),
              _buildPlanOption('Standard Plan', '20 Pickups\nReal Time\nSms',
                  '\$19.99/Month', true),
              _buildPlanOption('Premium Plan',
                  'Unlimited\nReal Time\nSms & Email', '\$29.99/Month', false),
              SizedBox(height: 20),
              Text(
                'Payment Method',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              _buildPaymentOption('Visa/MasterCard', '**** **** **** 1234',
                  Icons.credit_card, 'visa', true),
              _buildPaymentOption('PayPal', 'paypal@account.com', Icons.paypal,
                  'paypal', false),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  elevation: 5,
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                child: Center(
                  child: Text('Subscribe Now',
                      style: TextStyle(fontSize: 16, color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlanOption(
      String title, String details, String price, bool isSelected) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue.shade50 : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey.shade200, width: 2),
      ),
      child: Row(
        children: [
          Radio(
            value: isSelected,
            groupValue: true,
            onChanged: (bool? value) {
              // Handle radio button selection
            },
            activeColor: Colors.blue,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 5),
                Text(details,
                    style: TextStyle(fontSize: 14, color: Colors.grey[600])),
              ],
            ),
          ),
          Text(price,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildPaymentOption(String title, String details, IconData icon,
      String type, bool isSelected) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue.shade50 : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey.shade200, width: 2),
      ),
      child: Row(
        children: [
          Radio(
            value: isSelected,
            groupValue: true,
            onChanged: (bool? value) {
              // Handle radio button selection
            },
            activeColor: Colors.blue,
          ),
          SizedBox(width: 10),
          Icon(icon, color: isSelected ? Colors.blue : Colors.grey),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                SizedBox(height: 5),
                Text(details,
                    style: TextStyle(fontSize: 14, color: Colors.grey[600])),
              ],
            ),
          ),
          if (type == 'visa')
            Image.asset(
              'assets/visa.png',
              height: 30,
            )
          else if (type == 'paypal')
            Image.asset(
              'assets/paypal.png',
              height: 30,
            ),
        ],
      ),
    );
  }
}
