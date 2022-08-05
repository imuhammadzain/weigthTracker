// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  final String weight;
  final String Time;

  const MyWidget({Key? key, required this.Time, required this.weight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(Time),
        subtitle: Text("Weight : $weight"),
        trailing: InkWell(
            onTap: () {},
            child: Icon(
              Icons.delete,
              color: Colors.red,
            )),
      ),
    );
  }
}
