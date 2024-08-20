import 'package:flutter/material.dart';
import 'package:freshfold_app/Views/Screens/Customer_Screen/Order_Details/order_details.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SubscriptionScreenState createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  // Initially selected plan
  String _selectedPlan = 'Standard Plan';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Membership',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.close, color: Colors.black),
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
              const Text(
                'Welcome to Our Subscription Service!',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'Choose a plan, manage your subscription, and enjoy hassle-free service with just a few clicks.',
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
              const SizedBox(height: 30),
              _buildPlanOption(
                  'Basic Plan', 'Wash fold iron', '\$25.99/monh'),
              _buildPlanOption('Standard Plan', ' Wash fold Iron , stain removal',
                  '\$45.99/ month'),
              _buildPlanOption('Premium Plan',
                  'Wash fold Iron,stain removal, dry cleaning', '\$69.99/month'),
              const SizedBox(height: 20),
              // const Text(
              //   'Payment Method',
              //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              // ),
              // _buildPaymentOption('Visa/MasterCard', '**** **** **** 1234',
              //     Icons.credit_card, 'visa'),
              // _buildPaymentOption(
              //     'PayPal', 'paypal@account.com', Icons.paypal, 'paypal'),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  elevation: 5,
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Center(
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

  Widget _buildPlanOption(String title, String details, String price) {
    bool isSelected = _selectedPlan == title;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedPlan = title;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
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
                setState(() {
                  _selectedPlan = title;
                });
              },
              activeColor: Colors.blue,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 5),
                  Text(details,
                      style: TextStyle(fontSize: 14, color: Colors.grey[600])),
                ],
              ),
            ),
            Text(price,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentOption(
      String title, String details, IconData icon, String type) {
    bool isSelected =
        false; // Assume single selection for payment not needed for now

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
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
            onChanged: (bool? value) {},
            activeColor: Colors.blue,
          ),
          const SizedBox(width: 10),
          Icon(icon, color: isSelected ? Colors.blue : Colors.grey),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 5),
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
