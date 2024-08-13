import 'package:flutter/material.dart';
import 'package:freshfold_app/Utils/Constants.dart';
import 'package:freshfold_app/Views/Screens/Customer_Screen/Notifications/notifications.dart';

import '../Laundry_service/laundry_services.dart';
import '../Membership/plans.dart';
import '../My Account/account.dart';
import '../My_Orders/my_orders.dart';

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.white,
//         leading: const Padding(
//           padding: EdgeInsets.all(8.0),
//           child: CircleAvatar(
//             backgroundImage: AssetImage('assets/logo.png'), // Placeholder image
//           ),
//         ),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.notifications, color: Colors.black),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.symmetric(horizontal: 16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(height: 8),
//             TextField(
//               decoration: InputDecoration(
//                 hintText: 'Search Laundry store',
//                 prefixIcon: const Icon(Icons.search),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(12),
//                   borderSide: BorderSide.none,
//                 ),
//                 filled: true,
//                 fillColor: Colors.grey[200],
//               ),
//             ),
//             const SizedBox(height: 16),
//             Container(
//               padding: const EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 color: Colors.blue[100],
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Row(
//                 children: [
//                   const Expanded(
//                     child: Text(
//                       'Get Your First Month 50% Off!',
//                       style:
//                           TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => LaundryServicesPage(),
//                           ));
//                     },
//                     style: ElevatedButton.styleFrom(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                     child: Text(
//                       'TRY IT FOR FREE',
//                       style: TextStyle(color: ColorConstants.backgroundColor1),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 16),
//             const Text(
//               'Laundry services',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 18),
//             GridView.count(
//               crossAxisCount: 2,
//               crossAxisSpacing: 16,
//               mainAxisSpacing: 16,
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               children: [
//                 ServiceCard(icon: Icons.local_laundry_service, label: 'Iron'),
//                 ServiceCard(icon: Icons.dry_cleaning, label: 'Dry'),
//                 ServiceCard(icon: Icons.checkroom, label: 'Fold'),
//                 ServiceCard(icon: Icons.wash, label: 'Wash'),
//               ],
//             ),
//             const SizedBox(height: 16),
//             const Text(
//               'Subscription Plans',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 16),
//             SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 children: [
//                   SubscriptionCard(
//                     planName: 'Basic Plan',
//                     price: '\$9.99/Month',
//                     features: ['10 Pickups', 'Real Time', 'Email'],
//                   ),
//                   SizedBox(width: 16),
//                   SubscriptionCard(
//                     planName: 'Standard Plan',
//                     price: '\$19.99/Month',
//                     features: ['20 Pickups', 'Real Time', 'Sms'],
//                     highlight: true,
//                   ),
//                   SizedBox(width: 16),
//                   SubscriptionCard(
//                     planName: 'Premium Plan',
//                     price: '\$29.99/Month',
//                     features: ['Unlimited', 'Real Time', 'Sms & Email'],
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 16),
//             const Text(
//               'Last orders',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 16),
//             OrderCard(
//                 orderNumber: 123,
//                 date: 'Thu, 1 Apr',
//                 time: '10:00',
//                 price: 60.23),
//             OrderCard(
//                 orderNumber: 123,
//                 date: 'Thu, 1 Apr',
//                 time: '10:00',
//                 price: 60.23),
//             OrderCard(
//                 orderNumber: 123,
//                 date: 'Thu, 1 Apr',
//                 time: '10:00',
//                 price: 60.23),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class ServiceCard extends StatelessWidget {
//   final IconData icon;
//   final String label;
//
//   ServiceCard({required this.icon, required this.label});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(color: Colors.blue),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.2),
//             spreadRadius: 2,
//             blurRadius: 5,
//             offset: const Offset(0, 3),
//           ),
//         ],
//       ),
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(icon, size: 80, color: Colors.blue),
//           const SizedBox(height: 8),
//           Text(label, style: const TextStyle(fontSize: 16)),
//         ],
//       ),
//     );
//   }
// }
//
// class SubscriptionCard extends StatelessWidget {
//   final String planName;
//   final String price;
//   final List<String> features;
//   final bool highlight;
//
//   SubscriptionCard({
//     required this.planName,
//     required this.price,
//     required this.features,
//     this.highlight = false,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 16),
//       decoration: BoxDecoration(
//         color: highlight ? Colors.blue[50] : Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         border: highlight ? Border.all(color: Colors.blue) : null,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.2),
//             spreadRadius: 2,
//             blurRadius: 5,
//             offset: const Offset(0, 3),
//           ),
//         ],
//       ),
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(planName,
//               style:
//                   const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//           const SizedBox(height: 8),
//           Text(price, style: const TextStyle(fontSize: 14, color: Colors.grey)),
//           const SizedBox(height: 8),
//           for (var feature in features)
//             Text(feature, style: const TextStyle(fontSize: 14)),
//         ],
//       ),
//     );
//   }
// }
//
// class OrderCard extends StatelessWidget {
//   final int orderNumber;
//   final String date;
//   final String time;
//   final double price;
//
//   OrderCard({
//     required this.orderNumber,
//     required this.date,
//     required this.time,
//     required this.price,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.2),
//             spreadRadius: 2,
//             blurRadius: 5,
//             offset: const Offset(0, 3),
//           ),
//         ],
//       ),
//       padding: const EdgeInsets.all(16),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   const Icon(Icons.access_time, size: 20, color: Colors.orange),
//                   const SizedBox(width: 8),
//                   Text('Order #$orderNumber (2 bags)',
//                       style: const TextStyle(fontSize: 16)),
//                 ],
//               ),
//               const SizedBox(height: 8),
//               Text('$time, $date',
//                   style: const TextStyle(fontSize: 14, color: Colors.grey)),
//             ],
//           ),
//           Text('\$$price',
//               style:
//                   const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//         ],
//       ),
//     );
//   }
// }
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu, color: Colors.black),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.black),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NotificationPage(),
                  ));
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    ColorConstants.backgroundColor1,
                    ColorConstants.backgroundColor2
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/logo.png'),
                    // Placeholder image
                    radius: 40,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Sidra Khan',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home,
                  color: ColorConstants.backgroundColor1, size: 26),
              title: const Text('Home'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.local_laundry_service,
                color: ColorConstants.backgroundColor1,
                size: 26,
              ),
              title: const Text('Laundry services'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LaundryServicesPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.shopping_basket,
                color: ColorConstants.backgroundColor1,
                size: 26,
              ),
              title: const Text('My Orders'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyOrdersScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.subscriptions,
                color: ColorConstants.backgroundColor1,
                size: 26,
              ),
              title: const Text('Subscriptions'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SubscriptionScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.person,
                color: ColorConstants.backgroundColor1,
                size: 26,
              ),
              title: const Text('My Account'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyAccountScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.logout,
                color: Colors.red,
                size: 26,
              ),
              title: const Text('Log Out'),
              onTap: () {
                // Handle logout
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                hintText: 'Search Laundry store',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: ColorConstants.backgroundColor2,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Get Your First Month 50% Off!',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LaundryServicesPage(),
                          ));
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'TRY IT FOR FREE',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Laundry services',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 18),
            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 18,
              mainAxisSpacing: 18,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                ServiceCard(icon: Icons.local_laundry_service, label: 'Iron'),
                ServiceCard(icon: Icons.dry_cleaning, label: 'Dry'),
                ServiceCard(icon: Icons.checkroom, label: 'Fold'),
                ServiceCard(icon: Icons.wash, label: 'Wash'),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Subscription Plans',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SubscriptionCard(
                    planName: 'Basic Plan',
                    price: '\$9.99/Month',
                    features: ['10 Pickups', 'Real Time', 'Email'],
                  ),
                  const SizedBox(width: 16),
                  SubscriptionCard(
                    planName: 'Standard Plan',
                    price: '\$19.99/Month',
                    features: ['20 Pickups', 'Real Time', 'Sms'],
                    highlight: true,
                  ),
                  const SizedBox(width: 16),
                  SubscriptionCard(
                    planName: 'Premium Plan',
                    price: '\$29.99/Month',
                    features: ['Unlimited', 'Real Time', 'Sms & Email'],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Last orders',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            OrderCard(
                orderNumber: 123,
                date: 'Thu, 1 Apr',
                time: '10:00',
                price: 60.23),
            OrderCard(
                orderNumber: 123,
                date: 'Thu, 1 Apr',
                time: '10:00',
                price: 60.23),
            OrderCard(
                orderNumber: 123,
                date: 'Thu, 1 Apr',
                time: '10:00',
                price: 60.23),
          ],
        ),
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final IconData icon;
  final String label;

  ServiceCard({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 60, color: Colors.blue),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}

class SubscriptionCard extends StatelessWidget {
  final String planName;
  final String price;
  final List<String> features;
  final bool highlight;

  SubscriptionCard({
    required this.planName,
    required this.price,
    required this.features,
    this.highlight = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: highlight ? Colors.blue[50] : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: highlight ? Border.all(color: Colors.blue) : null,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(planName,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(price, style: const TextStyle(fontSize: 14, color: Colors.grey)),
          const SizedBox(height: 8),
          for (var feature in features)
            Text(feature, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  final int orderNumber;
  final String date;
  final String time;
  final double price;

  OrderCard({
    required this.orderNumber,
    required this.date,
    required this.time,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.access_time, size: 20, color: Colors.orange),
                  const SizedBox(width: 8),
                  Text('Order #$orderNumber (2 bags)',
                      style: const TextStyle(fontSize: 16)),
                ],
              ),
              const SizedBox(height: 8),
              Text('$time, $date',
                  style: const TextStyle(fontSize: 14, color: Colors.grey)),
            ],
          ),
          Text('\$$price',
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

// Placeholder Pages
