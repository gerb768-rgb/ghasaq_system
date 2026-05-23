@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: const Text("نظام غسق المحاسبي")),
    drawer: Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text("قائمة التحكم", style: TextStyle(color: Colors.white, fontSize: 24)),
          ),
          ListTile(
            leading: const Icon(Icons.inventory),
            title: const Text("الجرد والأدوية"),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const InventoryScreen())),
          ),
          ListTile(
            leading: const Icon(Icons.add_box),
            title: const Text("إضافة دواء جديد"),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AddMedicationScreen())),
          ),
          ListTile(
            leading: const Icon(Icons.receipt_long),
            title: const Text("سلة المبيعات (الفواتير)"),
            onTap: () {
              // هنا سنربط شاشة الفواتير لاحقاً
            },
          ),
        ],
      ),
    ),
    body: const Center(child: Text("مرحباً بك في نظام غسق الصيدلي")),
  );
}
