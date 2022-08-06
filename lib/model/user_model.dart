class User {
  String id;
  final String weight;
  final DateTime? date;
  final DateTime? time;

  User(
      {this.id = '',
      required this.weight,
      required this.date,
      required this.time});

  Map<String, dynamic> toJson() =>
      {'id': id, 'weight': weight, 'time': time, 'date': date};

  static User fromJson(Map<String, dynamic> json) {
    return User(weight: json['weight'], date: json['date'], time: json['time']);
  }
}
