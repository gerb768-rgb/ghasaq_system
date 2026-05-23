ListTile(
  leading: const Icon(Icons.receipt_long),
  title: const Text("نقطة البيع"),
  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const PosScreen())),
),
