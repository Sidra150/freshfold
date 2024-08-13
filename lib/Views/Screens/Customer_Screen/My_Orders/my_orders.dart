import 'package:flutter/material.dart';
import 'package:freshfold_app/Views/Screens/Customer_Screen/Home/home.dart';

import '../Order_Details/order_details.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({super.key});

  @override
  _MyOrdersScreenState createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
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
                  builder: (context) => HomePage(),
                ));
          },
        ),
        title: const Text(
          'My Orders',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.blue,
          labelColor: Colors.blue,
          unselectedLabelColor: Colors.grey,
          tabs: const [
            Tab(text: 'Processing'),
            Tab(text: 'Delivered'),
            Tab(text: 'Review'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildOrderList('Processing'),
          _buildOrderList('Delivered'),
          _buildOrderList('Review'),
        ],
      ),
    );
  }

  Widget _buildOrderList(String tab) {
    return ListView(
      padding: const EdgeInsets.all(8.0),
      children: [
        _buildOrderCard(
          'Fresh Fold',
          '20 Jun, 11:35 am',
          'T-shirt 1 Wash Only\nT-shirt 2 Wash & Iron\nJacket 1 Dry & Clean',
          '\$28',
          tab == 'Processing'
              ? 'AWAITING APPROVAL'
              : (tab == 'Delivered' ? 'DELIVERED' : 'PENDING REVIEW'),
          tab == 'Processing'
              ? Colors.red.shade100
              : (tab == 'Delivered'
                  ? Colors.green.shade100
                  : Colors.orange.shade100),
          tab == 'Processing'
              ? Colors.red
              : (tab == 'Delivered' ? Colors.green : Colors.orange),
        ),
        _buildOrderCard(
          'Fresh Fold',
          '20 Jun, 11:35 am',
          'T-shirt 1 Wash Only\nT-shirt 2 Wash & Iron\nJacket 1 Dry & Clean',
          '\$28',
          tab == 'Processing'
              ? 'OUT FOR DELIVERY'
              : (tab == 'Delivered' ? 'DELIVERED' : 'PENDING REVIEW'),
          tab == 'Processing'
              ? Colors.orange.shade100
              : (tab == 'Delivered'
                  ? Colors.green.shade100
                  : Colors.orange.shade100),
          tab == 'Processing'
              ? Colors.orange
              : (tab == 'Delivered' ? Colors.green : Colors.orange),
        ),
      ],
    );
  }

  Widget _buildOrderCard(String title, String date, String description,
      String price, String status, Color statusBgColor, Color statusTextColor) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.blue.shade50,
                  child: const Icon(Icons.local_laundry_service,
                      color: Colors.blue),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      date,
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  decoration: BoxDecoration(
                    color: statusBgColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(
                        color: statusTextColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  ),
                ),
              ],
            ),
            Divider(height: 20, color: Colors.grey[300]),
            Text(description,
                style: const TextStyle(height: 1.5, fontSize: 14)),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('3 Product',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                Text(price,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        fontSize: 16)),
              ],
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OrderDetailScreen(),
                      ));
                },
                style: ElevatedButton.styleFrom(
                  elevation: 4,
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                ),
                child: const Text('Order Detail',
                    style: TextStyle(fontSize: 14, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
