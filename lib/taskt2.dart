import 'package:flutter/material.dart';

class task2 extends StatefulWidget {
  const task2({super.key});

  @override
  State<task2> createState() => _task2State();
}

class _task2State extends State<task2> {
  @override
  Widget build(BuildContext context) {
    List<Color> boxClr = [
      Colors.red,
      Colors.yellow,
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.brown,
      Colors.teal,
      Colors.pink,
      Colors.purple,
      Colors.deepPurple,
      Colors.red,
    ];

    return Scaffold(
        appBar: AppBar(
          title: Text("GridView.bluider"),
          backgroundColor: Colors.teal,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.builder(
            itemCount: 10,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: 2 / 2,
            ),
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  color: boxClr[index],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                    child: Text(index.toString(),
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: boxClr[index + 1]))),
              );
            },
          ),
        ));
  }
}
