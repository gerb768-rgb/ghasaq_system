import 'package:flutter/material.dart';
import '../database_helper.dart';

class InventoryScreen extends StatefulWidget {
  const InventoryScreen({super.key});

  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  List<Map<String, dynamic>> _medications = [];

  @override
  void initState() {
    super.initState();
    _refreshData();
  }

  void _refreshData() async {
    final db = await DatabaseHelper.instance.database;
    final data = await db.query('medications');
    setState(() {
      _medications = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("مخزون الأدوية")),
      body: ListView.builder(
        itemCount: _medications.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(_medications[index]['name']),
          subtitle: Text("الكمية: ${_medications[index]['stock_quantity']}"),
        ),
      ),
    );
  }
}
