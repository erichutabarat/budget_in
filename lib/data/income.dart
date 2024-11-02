class Income {
  String id;
  String date;
  double amount; // Use double for monetary values
  String from;
  String description;

  Income({
    required this.id,
    required this.date,
    required this.amount,
    required this.from,
    required this.description,
  });

  // Method to convert JSON string back to Income object
  factory Income.fromJson(Map<String, dynamic> json) {
    return Income(
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
