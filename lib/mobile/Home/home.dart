import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:weightrecorder/mobile/Home/addweight.dart';
import 'package:weightrecorder/mobile/Home/widgets.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

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
              child: SizedBox(
                height: 50,
                width: 50,
                child: FloatingActionButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  backgroundColor: const Color.fromARGB(255, 4, 153, 58),
                  elevation: 25,
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Addweight()));
                  },
                  child: const Icon(Icons.add),
                ),
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
}
