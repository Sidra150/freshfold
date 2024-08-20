import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:freshfold_app/Views/Screens/Bottom_Nav/bottom_navigation.dart';
import 'package:freshfold_app/Views/Screens/Customer_Screen/My_Orders/my_orders.dart';

import '../Add_Address/address.dart';

class OrderDetailScreen extends StatelessWidget {
  const OrderDetailScreen({super.key});

  void _showOrderStatus(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Order Status',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              _buildStatusItem(Icons.check_circle, 'Confirmed',
                  'Wed, 6 Jun 2019, 10:00 PM', Colors.green),
              _buildStatusItem(Icons.local_shipping, 'Picked up',
                  'Wed, 6 Jun 2019, 10:00 PM', Colors.orange),
              _buildStatusItem(Icons.timelapse, 'In Progress',
                  'Wed, 6 Jun 2019, 10:00 PM', Colors.blue),
              _buildStatusItem(Icons.done_all, 'Delivered',
                  'Wed, 6 Jun 2019, 10:00 PM', Colors.purple),
            ],
          ),
        );
      },
    );
  }

  Widget _buildStatusItem(
      IconData icon, String status, String time, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: color),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(status, style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text(time, style: const TextStyle(color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }

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
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyOrdersScreen(),
                ));
          },
        ),
        title: const Text(
          'Order Detail',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildOrderSummary(),
            const SizedBox(height: 16),
            _images(),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () => _showOrderStatus(context),
              child: _buildDetailItem(Icons.check_circle, 'Order Status',
                  'Delivered', Colors.green, true),
            ),
            _buildDetailItem(Icons.calendar_today, 'Schedule Date',
                '10:00 AM, Thu, 1 Apr - 8:00 PM, Thu, 1 Apr', Colors.blue),
            _buildDetailItem(Icons.payment, 'Payment Method',
                'Cash On Delivery', Colors.orange),
            _buildDetailItem(Icons.location_pin, 'Pickup Address',
                'CT7B The Sparks, KDT Duong Noi', Colors.purple),
            _buildDetailItem(Icons.location_pin, 'Delivery Address',
                'CT7B The Sparks, KDT Duong Noi', Colors.purple),
            const Spacer(),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                elevation: 6,
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                minimumSize: const Size(double.infinity, 50.0),
              ),
              child: const Text('Schedule a Laundry',
                  style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _images() {
    return Row(
      children: [Image(image: AssetImage("assets/t-shirt.png"))],
    );
  }

  Widget _buildOrderSummary() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Order #123 (2 bags)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text('11:35 AM, Thu, 15 Jun 2019',
              style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 16),
          _buildOrderItem('Wash & Fold', '2 x Tshirt (Men)', '\$6'),
          _buildOrderItem('Wash & Fold', '3 x Jean (Men)', '\$6'),
          _buildOrderItem('Wash & Iron', '2 x Tshirt (Men)', '\$6'),
          _buildOrderItem('Wash & Iron', '3 x Jean (Men)', '\$6'),
          const Divider(thickness: 1),
          _buildTotalRow('Subtotal', '\$18'),
          _buildTotalRow('Tax', '\$10'),
          _buildTotalRow('Total', '\$28', isTotal: true),
        ],
      ),
    );
  }

  Widget _buildOrderItem(String category, String item, String price) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Text('$category - $item')),
          Text(price, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildTotalRow(String label, String amount, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: TextStyle(
                  fontWeight: isTotal ? FontWeight.bold : FontWeight.normal)),
          Text(amount,
              style: TextStyle(
                  fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
                  color: isTotal ? Colors.blue : Colors.black)),
        ],
      ),
    );
  }

  Widget _buildDetailItem(
      IconData icon, String title, String subtitle, Color color,
      [bool isClickable = false]) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: color),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(subtitle, style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ),
          if (isClickable)
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey)
        ],
      ),
    );
  }
}
