import 'package:flutter/material.dart';
import 'package:freshfold_app/Views/Screens/Customer_Screen/Laundry_service/laundry_services.dart';

import '../Add_Address/address.dart';

class SchedulePickupPage extends StatefulWidget {
  const SchedulePickupPage({super.key});

  @override
  _SchedulePickupPageState createState() => _SchedulePickupPageState();
}

class _SchedulePickupPageState extends State<SchedulePickupPage> {
  DateTime? pickupDateTime;
  DateTime? deliveryDateTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Schedule A Pickup'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LaundryServicesPage(),
                ));
          },
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionTitle(title: 'Price details'),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PriceDetailRow(label: 'Subtotal', value: '\$18'),
                  const Divider(),
                  PriceDetailRow(label: 'Tax', value: '\$10'),
                  const Divider(),
                  PriceDetailRow(label: 'Total', value: '\$28', isTotal: true),
                ],
              ),
            ),
            const SizedBox(height: 16),
            SectionTitle(title: 'Schedule Date'),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: DatePickerField(
                    label: 'Pickup Time',
                    dateTime: pickupDateTime,
                    onPressed: () => pickDateTime(isPickup: true),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: DatePickerField(
                    label: 'Delivery Time',
                    dateTime: deliveryDateTime,
                    onPressed: () => pickDateTime(isPickup: false),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SectionTitle(title: 'Payment method'),
            const SizedBox(height: 8),
            PaymentMethodField(
              methods: [
                PaymentMethod(
                  title: 'Pay Via Paypal',
                  icon: Icons.paypal_outlined,
                ),
                PaymentMethod(
                  title: 'Visa/Master Card',
                  icon: Icons.credit_card,
                ),
                PaymentMethod(
                  title: 'Cash On Delivery',
                  icon: Icons.delivery_dining,
                  selected: true,
                ),
              ],
            ),
            const SizedBox(height: 16),
            SectionTitle(title: 'Address'),
            const SizedBox(height: 8),
            AddressField(
              type: 'Pickup Address',
              address: 'CT7B The Sparks, KDT Duong Noi, Str. Ha Dong, Ha Noi',
              icon: Icons.location_on,
              color: Colors.blue,
            ),
            const SizedBox(height: 8),
            AddressField(
              type: 'Delivery Address',
              address: 'CT7B The Sparks, KDT Duong Noi, Str. Ha Dong, Ha Noi',
              icon: Icons.location_on,
              color: Colors.pink,
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LocationScreen(),
                    ));
              },
              child: const Text("Confirm Order"),
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
          ],
        ),
      ),
    );
  }

  void pickDateTime({required bool isPickup}) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (selectedDate != null) {
      TimeOfDay? selectedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (selectedTime != null) {
        final DateTime fullDateTime = DateTime(
          selectedDate.year,
          selectedDate.month,
          selectedDate.day,
          selectedTime.hour,
          selectedTime.minute,
        );

        setState(() {
          if (isPickup) {
            pickupDateTime = fullDateTime;
          } else {
            deliveryDateTime = fullDateTime;
          }
        });
      }
    }
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }
}

class PriceDetailRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isTotal;

  PriceDetailRow(
      {super.key,
      required this.label,
      required this.value,
      this.isTotal = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
              fontSize: 16,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            color: isTotal ? Colors.blue : Colors.black,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}

class DatePickerField extends StatelessWidget {
  final String label;
  final DateTime? dateTime;
  final VoidCallback onPressed;

  DatePickerField(
      {super.key,
      required this.label,
      required this.dateTime,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label,
                style: const TextStyle(fontSize: 14, color: Colors.grey)),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 20, color: Colors.blue),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    dateTime != null
                        ? "${dateTime!.toLocal()}".split(' ')[0]
                        : 'Select Date',
                    style: const TextStyle(fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const Spacer(),
                const Icon(Icons.access_time, size: 20, color: Colors.blue),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    dateTime != null
                        ? "${dateTime!.toLocal()}".split(' ')[1].split('.')[0]
                        : 'Select Time',
                    style: const TextStyle(fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentMethodField extends StatelessWidget {
  final List<PaymentMethod> methods;

  PaymentMethodField({super.key, required this.methods});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: methods.map((method) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 4),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: method.selected ? Colors.blue[50] : Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
                color: method.selected ? Colors.blue : Colors.grey[300]!),
          ),
          child: Row(
            children: [
              Icon(
                method.icon,
                size: 24,
                color: method.selected ? Colors.blue : Colors.black,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  method.title,
                  style: const TextStyle(fontSize: 16),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (method.selected)
                const Icon(
                  Icons.check_circle,
                  color: Colors.blue,
                  size: 24,
                ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

class PaymentMethod {
  final String title;
  final IconData icon;
  final bool selected;

  PaymentMethod(
      {required this.title, required this.icon, this.selected = false});
}

class AddressField extends StatelessWidget {
  final String type;
  final String address;
  final IconData icon;
  final Color color;

  AddressField(
      {super.key,
      required this.type,
      required this.address,
      required this.icon,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, size: 24, color: color),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(type,
                    style: const TextStyle(fontSize: 14, color: Colors.grey)),
                const SizedBox(height: 4),
                Text(
                  address,
                  style: const TextStyle(fontSize: 16),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
