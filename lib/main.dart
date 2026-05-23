class Medication {
  final String name;
  final double price;

  Medication(this.name, this.price);
}

// هذه هي قائمة الأدوية الفعلية في نظامك
final List<Medication> pharmacyItems = [
  Medication("بندول", 15.5),
  Medication("أموكسيسيلين", 45.0),
  Medication("فيتامين C", 20.0),
];
