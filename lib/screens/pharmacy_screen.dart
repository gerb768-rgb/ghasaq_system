import 'package:flutter/material.dart';
import '../models.dart';

class PharmacyScreen extends StatefulWidget {
  const PharmacyScreen({super.key});

  @override
  State<PharmacyScreen> createState() => _PharmacyScreenState();
}

class _PharmacyScreenState extends State<PharmacyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("صرف الأدوية")),
      body: ListView.builder(
        itemCount: pharmacyItems.length,
        itemBuilder: (context, index) {
          final med = pharmacyItems[index];
          return ListTile(
            leading: const Icon(Icons.medication, color: Colors.blue),
            title: Text(med.name),
            trailing: Text("${med.price} ر.س"),
            onTap: () {
              // إضافة الدواء للفاتورة
              setState(() {
                salesCart.add(med);
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("تم إضافة ${med.name} للفاتورة")),
              );
            },
          );
        },
      ),
    );
  }
}
