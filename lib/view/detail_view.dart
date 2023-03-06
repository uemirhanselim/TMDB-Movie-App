import 'package:flutter/material.dart';

class DetailView extends StatelessWidget {
  const DetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1c1c27),
      appBar: AppBar(
        backgroundColor: const Color(0xff1c1c27),
        leading: const Icon(Icons.arrow_back),
        title: const Text("Movie Name"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 200,
                      width: 150,
                      color: Colors.yellow,
                    ),
                    const Positioned(bottom: 10, left: 20, child: Text("6.1"))
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  children: const [
                    Text(
                      "Type",
                      style: TextStyle(color: Colors.red),
                    ),
                    Text(
                      "Date",
                      style: TextStyle(color: Colors.red),
                    ),
                    Text(
                      "BLABLA",
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                )
              ],
            ),
            Row(
              children: List.generate(
                  3, (index) => const Chip(label: Text("Action"))),
            )
          ],
        ),
      ),
    );
  }
}
