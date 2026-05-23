import 'package:flutter/material.dart';
import '../database_helper.dart';

class AddMedicationScreen extends StatefulWidget {
  const AddMedicationScreen({super.key});

  @override
  State<AddMedicationScreen> createState() => _AddMedicationScreenState();
}

class _AddMedicationScreenState extends State<AddMedicationScreen> {
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _stockController = TextEditingController();

  Future<void> _saveMedication() async {
    final db = await DatabaseHelper.instance.database;
    await db.insert('medications', {
      'name': _nameController.text,
      'price': double.parse(_priceController.text),
      'stock_quantity': int.parse(_stockController.text),
      'expiry_date': '2027-01-01', // سيتم تحسينه لاحقاً
      'barcode': '123456789' // يمكن ربطه بكاميرا الباركود لاحقاً
    });
    if (mounted) Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("إضافة دواء جديد")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _nameController, decoration: const InputDecoration(labelText: 'اسم الدواء')),
            TextField(controller: _priceController, decoration: const InputDecoration(labelText: 'السعر')),
            TextField(controller: _stockController, decoration: const InputDecoration(labelText: 'الكمية')),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _saveMedication, child: const Text("حفظ في النظام")),
          ],
        ),
      ),
    );
  }
}
