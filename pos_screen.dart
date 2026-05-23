import 'package:flutter/material.dart';
import '../database_helper.dart';

class PosScreen extends StatefulWidget {
  const PosScreen({super.key});

  @override
  State<PosScreen> createState() => _PosScreenState();
}

class _PosScreenState extends State<PosScreen> {
  final _barcodeController = TextEditingController();

  Future<void> _processSale() async {
    final db = await DatabaseHelper.instance.database;
    // هنا نبحث عن الدواء ونقوم بخصم 1 من الكمية
    final result = await db.rawUpdate('''
      UPDATE medications 
      SET stock_quantity = stock_quantity - 1 
      WHERE barcode = ? AND stock_quantity > 0
    ''', [_barcodeController.text]);

    if (result > 0) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("تم البيع بنجاح!")));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("الدواء غير موجود أو نفدت الكمية!")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("نقطة البيع (الفاتورة)")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _barcodeController, decoration: const InputDecoration(labelText: 'امسح الباركود للبيع')),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _processSale, child: const Text("تأكيد البيع وخصم المخزون")),
          ],
        ),
      ),
    );
  }
}
