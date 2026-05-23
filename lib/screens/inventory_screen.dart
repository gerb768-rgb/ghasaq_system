import 'package:flutter/material.dart';
import '../database_helper.dart';

class InventoryScreen extends StatefulWidget {
  const InventoryScreen({super.key});

  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  List<Map<String, dynamic>> _allMedications = [];
  List<Map<String, dynamic>> _foundMedications = [];

  @override
  void initState() {
    super.initState();
    _refreshData();
  }

  void _refreshData() async {
    final db = await DatabaseHelper.instance.database;
    final data = await db.query('medications');
    setState(() {
      _allMedications = data;
      _foundMedications = data; // البداية: عرض الكل
    });
  }

  // دالة البحث الذكي
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      results = _allMedications;
    } else {
      results = _allMedications.where((med) =>
          med['name'].toLowerCase().contains(enteredKeyword.toLowerCase()) ||
          med['barcode'].toString().contains(enteredKeyword)
      ).toList();
    }

    setState(() {
      _foundMedications = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("مخزون الأدوية")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              onChanged: (value) => _runFilter(value),
              decoration: const InputDecoration(
                labelText: 'بحث بالاسم أو الباركود',
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _foundMedications.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(_foundMedications[index]['name']),
                subtitle: Text("الكمية: ${_foundMedications[index]['stock_quantity']} | الباركود: ${_foundMedications[index]['barcode']}"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
