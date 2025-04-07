// lib/models/expense_model.dart
class Expense {
  String id;
  String title;
  double amount;
  DateTime date;
  String category;
  String? tag;
  String currency; // Added currency field

  Expense({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
    this.tag,
    required this.currency,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'amount': amount,
      'date': date.toIso8601String(),
      'category': category,
      'tag': tag,
      'currency': currency,
    };
  }

  factory Expense.fromMap(Map<String, dynamic> map) {
    return Expense(
      id: map['id'],
      title: map['title'],
      amount: map['amount'],
      date: DateTime.parse(map['date']),
      category: map['category'],
      tag: map['tag'],
      currency: map['currency'] ?? 'USD', // Default to USD if null
    );
  }
}