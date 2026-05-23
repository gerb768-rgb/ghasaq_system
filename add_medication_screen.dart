IconButton(
  icon: const Icon(Icons.qr_code_scanner),
  onPressed: () async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const BarcodeScannerScreen()),
    );
    if (result != null) {
      // قم بتحديث حقل الباركود بالنص الذي قرأته الكاميرا
      _barcodeController.text = result;
    }
  },
),
