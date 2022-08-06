import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:weightrecorder/mobile/Home/addweight.dart';
import 'package:weightrecorder/mobile/Home/widgets.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Stack(
        children: [
          // ListView.builder(itemBuilder: itemBuilder)
          ListView(
            children: const [MyWidget(Time: "121212", weight: "255")],
          ),
          Align(
              alignment: Alignment.bottomRight,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Addweight()));
                },
                child: Container(
                    color: Colors.green,
                    height: 50,
                    width: 50,
                    child: const Icon(Icons.add)),
              )),
          Align(
              alignment: Alignment.bottomLeft,
              child: SizedBox(
                height: 50,
                width: 150,
                child: FloatingActionButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  backgroundColor: Colors.red,
                  elevation: 25,
                  onPressed: () => FirebaseAuth.instance.signOut(),
                  child: const Text("Sign Out"),
                ),
              )),
        ],
      ),
    );
  }

  Stream<List<User>> readUsers() => FirebaseFirestore.instance
      .collection('Users')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map<User>((doc) => User.fromJson(doc.data())).toList());
}
