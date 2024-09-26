import 'package:flutter/material.dart';
import 'package:pm/task_provider.dart';
import 'package:provider/provider.dart';

class test extends StatefulWidget {
  const test({super.key});

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  @override
  Widget build(BuildContext context) {
    final providerObj =Provider.of<game2Provider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text("Frontend Assesment"),
        backgroundColor: Colors.teal,

        centerTitle: true,
      ),

      body: Consumer<game2Provider>(builder: (context, vm, child) {

      return
        Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:
                [
                  buildRow(1),
                  buildRow(2),

            ]),
      InkWell(onTap:(){providerObj.setNewLocation(context);}),

            Positioned(

              left: vm.top.toDouble(),
              top: -100,
              child: Container(
                width: 400,
                height: 400,
                decoration: BoxDecoration(
                  color: Colors.teal.withOpacity(0.3),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              left: 300,
              top: -100,
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.teal.withOpacity(0.6),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        );
      },
      ),

    );
  }

  Padding buildRow(int row) {
    return
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.circular(10)
          ),
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:[
                  Text("Row ${row}, Text 1", style:TextStyle(color: Colors.white)),
                  Text("Row ${row}, Text 2", style:TextStyle(color: Colors.white)),

                ]),
          ),
        ),
      );
  }
}
