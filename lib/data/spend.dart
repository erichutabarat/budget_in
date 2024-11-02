class Spend {
  String id;
  String date;
  double amount; // Use double for monetary values
  String from;
  String description;

  Spend({
    required this.id,
    required this.date,
    required this.amount,
    required this.from,
    required this.description,
  });

  // Method to convert JSON string back to Income object
  factory Spend.fromJson(Map<String, dynamic> json) {
    return Spend(
      id: json['id'],
      date: json['date'],
      amount: json['amount'].toDouble(),
      from: json['from'],
      description: json['description'],
    );
  }

  // Method to convert Income object to JSON string
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date,
      'amount': amount,
      'from': from,
      'description': description,
    };
  }
}
