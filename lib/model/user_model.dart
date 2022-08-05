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

  Map<String, dynamic> toJason() =>
      {'id': id, 'weight': weight, 'time': time, 'date': date};
}
