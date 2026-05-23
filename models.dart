// أضف هذا الاستيراد في أعلى main.dart
import 'screens/inventory_screen.dart';

// داخل الـ Column في main.dart، أضف هذا الزر
ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const InventoryScreen()),
    );
  },
  child: const Text("عرض المخزون والجرد"),
),
