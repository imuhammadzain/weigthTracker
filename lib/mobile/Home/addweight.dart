import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:weightrecorder/mobile/Home/home.dart';
import 'package:weightrecorder/model/user_model.dart';

class Addweight extends StatefulWidget {
  const Addweight({Key? key}) : super(key: key);

  @override
  State<Addweight> createState() => _AddweightState();
}

class _AddweightState extends State<Addweight> {
  GlobalKey<FormState> Formkey = GlobalKey<FormState>();
  DateTime now = DateTime.now();
  final weightcontroller = TextEditingController();

  @override
  void dispose() {
    weightcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Weight Info"),
      ),
      body: Center(
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: Formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                child: TextFormField(
                  controller: weightcontroller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Weight",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: SizedBox(
                  height: 50,
                  width: 100,
                  child: FloatingActionButton(
                    backgroundColor: const Color.fromARGB(255, 7, 114, 255),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    onPressed: (() {
                      final user = User(
                          weight: weightcontroller.text,
                          date: DateTime(now.year, now.month, now.day),
                          time: DateTime(now.hour, now.minute, now.second));

                      createUser(user);
                      Navigator.of(context).pop(MaterialPageRoute(
                          builder: (context) => const Home()));
                    }),
                    child: const Text("ADD"),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future createUser(User user) async {
    final docUser = FirebaseFirestore.instance.collection('Users').doc();
    user.id = docUser.id;
    final json = user.toJson();
    await docUser.set(json);
  }
}
