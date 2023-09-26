class TestCase {
  final int id;
  final String name;
  final DateTime date;
  final String description;
  bool isSelected;
  TestCase({
    required this.id,
    required this.name,
    required this.date,
    required this.description,
    this.isSelected = false,
  });
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'date': date.toIso8601String(),
      'description': description,
    };
  }
}
