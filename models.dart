// منطق بسيط لاكتشاف الأدوية التي تنتهي خلال 3 أشهر
if (isExpiringSoon(med['expiry_date'])) {
   return ListTile(
     title: Text(med['name']),
     tileColor: Colors.red[100], // تلوين الدواء باللون الأحمر للتنبيه
     subtitle: Text("انتبه! الدواء يقترب من انتهاء الصلاحية"),
   );
}
