// أضف هذا الاستيراد في أعلى main.dart
import 'screens/add_medication_screen.dart';

// داخل الـ Column في main.dart، أضف هذا الزر بجانب زر الصيدلية
ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddMedicationScreen()),
    );
  },
  child: const Text("إضافة دواء للمخزن"),
),
