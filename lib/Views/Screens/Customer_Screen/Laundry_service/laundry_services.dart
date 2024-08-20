import 'package:flutter/material.dart';
import 'package:freshfold_app/Views/Screens/Bottom_Nav/bottom_navigation.dart';

import '../Shedule_PickUp/PickUp.dart';

class LaundryServicesPage extends StatefulWidget {
  const LaundryServicesPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LaundryServicesPageState createState() => _LaundryServicesPageState();
}

class _LaundryServicesPageState extends State<LaundryServicesPage> {
  int totalItems = 0;
  double totalPrice = 0.0;
  final List<LaundryItem> items = [
    LaundryItem('T-Shirt', 2.0, 'assets/t-shirt.png'),
    LaundryItem('Shirt', 5.0, 'assets/t-shirt.png'),
    LaundryItem('Sleeveless', 6.0, 'assets/t-shirt.png'),
    LaundryItem('Skirt', 3.0, 'assets/t-shirt.png'),
    LaundryItem('Polo', 4.0, 'assets/t-shirt.png'),
    LaundryItem('Suit', 8.0, 'assets/t-shirt.png'),
    LaundryItem('Jean', 3.0, 'assets/t-shirt.png'),
  ];

  void updateItemCount(LaundryItem item, int count) {
    setState(() {
      item.count += count;
      totalItems += count;
      totalPrice += count * item.price;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Laundry Services'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => bottomNav(),
                ));
          },
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: Column(
        children: [
          const SizedBox(height: 15),
          Container(
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildCategoryButton('Wash', true),
                _buildCategoryButton('Ironing', false),
                _buildCategoryButton('Fold', false),
                _buildCategoryButton('Dry', false),
                _buildCategoryButton('Clean', false),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return LaundryItemCard(
                  item: item,
                  onIncrement: () => updateItemCount(item, 1),
                  onDecrement: () {
                    if (item.count > 0) updateItemCount(item, -1);
                  },
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, -3),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Total',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    Text('$totalItems Items',
                        style:
                            const TextStyle(fontSize: 14, color: Colors.grey)),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('\$${totalPrice.toStringAsFixed(2)}',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    const Text('Cost',
                        style: TextStyle(fontSize: 14, color: Colors.grey)),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SchedulePickupPage(),
                        ));
                  },
                  child: const Text('Confirm Order',
                      style: TextStyle(fontSize: 16)),
                  style: ElevatedButton.styleFrom(
                    elevation: 6,
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryButton(String title, bool selected) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          foregroundColor: selected ? Colors.white : Colors.black,
          backgroundColor: selected ? Colors.blue : Colors.white,
          side: const BorderSide(color: Colors.blue),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(title),
      ),
    );
  }
}

class LaundryItem {
  final String name;
  final double price;
  final String imagePath;
  int count;

  LaundryItem(this.name, this.price, this.imagePath, {this.count = 0});
}

class LaundryItemCard extends StatelessWidget {
  final LaundryItem item;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const LaundryItemCard(
      {required this.item,
      required this.onIncrement,
      required this.onDecrement});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Image.asset(
            item.imagePath,
            height: 50,
            width: 50,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.name,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
                Text('\$${item.price}',
                    style: const TextStyle(fontSize: 14, color: Colors.grey)),
                DropdownButton<String>(
                  value: 'Men',
                  icon: const Icon(Icons.arrow_drop_down),
                  onChanged: (String? newValue) {},
                  items: <String>['Men', 'Women', 'Kids']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          Row(
            children: [
              IconButton(
                icon:
                    const Icon(Icons.remove_circle_outline, color: Colors.blue),
                onPressed: onDecrement,
              ),
              Text('${item.count}', style: const TextStyle(fontSize: 16)),
              IconButton(
                icon: const Icon(Icons.add_circle_outline, color: Colors.blue),
                onPressed: onIncrement,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
