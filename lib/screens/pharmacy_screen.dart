import 'package:flutter/material.dart';
import 'models.dart'; 
import 'screens/pharmacy_screen.dart'; // استيراد ملف الشاشة الذي أنشأناه للتو

void main() => runApp(const GhasaqApp());

class GhasaqApp extends StatelessWidget {
  const GhasaqApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text("نظام غسق للإدارة")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("مرحباً بك في نظام غسق المتكامل", style: TextStyle(fontSize: 20)),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // هذا الكود هو المسؤول عن الانتقال لشاشة الصيدلية
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PharmacyScreen()),
                  );
                },
                child: const Text("ابدأ العمليات (الصيدلية)"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
