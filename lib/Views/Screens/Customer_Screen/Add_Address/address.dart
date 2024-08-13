import 'package:flutter/material.dart';

import '../Order_Details/order_details.dart';
import '../Shedule_PickUp/PickUp.dart';

class LocationScreen extends StatelessWidget {
  final List<Map<String, String>> locations = [
    {"name": "CT7B Sparks", "address": "Le Trong Tan, Duong Noi, Ha Dong"},
    {
      "name": "VNPT Infomation Center",
      "address": "136 Nguyen Phong Sac, Dich Vong, Cau Giay, Ha Noi"
    },
    {
      "name": "Phung Khoang Church",
      "address": "No. 12, Phung Khoang, Trung Van, Tu Liem, Ha Noi"
    },
    {"name": "Ninh Giang", "address": "Ninh Giang, Hai Duong, Viet Nam"},
    {
      "name": "K3 Hospital",
      "address": "30, Cau Buou, Tan Trieu, Thanh Tri, Ha Noi"
    },
    {
      "name": "270 Nguyen Hoang Str",
      "address": "270 Nguyen Hoang, My Dinh, Nam Tu Liem, Ha Noi"
    },
    {"name": "Apartment CT7B", "address": "Phuc La, Ha Dong , Ha Noi"},
    {"name": "Nha Tho Lon Ha Noi", "address": "Ly Quoc Su, Hang Trong, Ha Noi"},
    {"name": "Vinmart", "address": "32 str, Tan Tay Do, Dang Phuong, Ha Noi"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SchedulePickupPage(),
                ));
          },
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Location',
              // style: TextStyle(
              //     color: Colors.black,
              //     fontSize: 16,
              //     fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.map, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            color: Colors.blue.shade50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildSegment('Home', true),
                _buildSegment('Work', false),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: locations.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.location_on, color: Colors.blueAccent),
                  title: Text(locations[index]['name']!,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(locations[index]['address']!,
                      style: TextStyle(color: Colors.grey.shade600)),
                  onTap: () {},
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OrderDetailScreen(),
                    ));
              },
              child: const Text("Next"),
              style: ElevatedButton.styleFrom(
                elevation: 6,
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                minimumSize: const Size(double.infinity, 50.0),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSegment(String text, bool selected) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: selected ? Colors.white : Colors.blue.shade50,
        borderRadius: BorderRadius.circular(30),
        boxShadow:
            selected ? [BoxShadow(color: Colors.black12, blurRadius: 6)] : [],
      ),
      child: Text(
        text,
        style: TextStyle(
          color: selected ? Colors.blueAccent : Colors.black54,
          fontWeight: selected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
