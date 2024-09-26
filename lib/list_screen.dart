import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pm/components/custom_appBar.dart';
import 'package:pm/constants/header.dart';
import 'package:pm/homepage_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: CustomAppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => HomepageScreen()));
        },
        backgroundColor:  Colors.orange,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 20, right: 20),
          child: Column(children: [
            HeaderText(),
            SizedBox(
              height: 15,
            ),
            Lottie.asset('assets/Animation - 1724904772483.json',
                width: 15.h),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 500,
              color: Colors.white.withOpacity(0.5),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    Text(
                      "Your wallet contains the following gems.",
                      style: TextStyle(fontSize: 16),
                    ),
                    Expanded(
                      child: StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('passwords')
                            .where('User_Id', isEqualTo: user!.uid)
                            .snapshots(),
                        builder: (context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {

                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return Center(
                                child: CircularProgressIndicator(
                                  color: Colors.green,
                                ));
                          }
                          else if (snapshot.data!.docs.isEmpty) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "There is no item in your wallet. Click + button below to add item.",
                                  style: TextStyle(fontSize: 19),
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  HomepageScreen()));
                                    },

                                    child: Icon(Icons.add, color: Color.fromRGBO(08, 134, 167, 1),)),
                              ],
                            );
                          }

                          return ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(08, 134, 167, 0.1),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child:

                                  ListTile(
                                    leading: CircleAvatar(
                                      backgroundColor: Color.fromRGBO(08, 134, 167, 1),
                                      child:
                                      Text(snapshot.data!.docs[index]['accountName'][0],style:TextStyle(color:Colors.white))),
                                    title: Text(snapshot.data!.docs[index]['accountName']),
                                    subtitle: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(snapshot.data!.docs[index]['accountEmail']),
                                      ],
                                    ),
                                    trailing:
                                    SizedBox(
                                        width: 80,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            InkWell(
                                              onTap: () async {
                                                final result = await showDialog<bool>(
                                                  context: context,
                                                  builder: (context) => AlertDialog(
                                                    title: const Text('Are you sure?'),
                                                    content: const Text('This action will permanently delete this data'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () => Navigator.pop(context, false),
                                                        child: const Text('Cancel'),
                                                      ),
                                                      TextButton(
                                                        onPressed: () => Navigator.pop(context, true),
                                                        child: const Text('Delete'),
                                                      ),

                                                    ],
                                                  ),
                                                );

                                                if (result == null || !result) {
                                                  return;
                                                }
                                                FirebaseFirestore.instance
                                                    .collection('passwords')
                                                    .doc(snapshot.data!.docs[index].id)
                                                    .delete();
                                              },
                                              child: Icon(
                                                Icons.delete_forever,
                                                color: Colors.deepOrange,
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () async {
                                                final result = await showDialog<bool>(
                                                  context: context,
                                                  builder: (context) => AlertDialog(
                                                    title:  Text(snapshot.data!.docs[index]['accountName']),
                                                    content: Text(snapshot.data!.docs[index]['accountEmail']+'(${snapshot.data!.docs[index]['accountPassword']})'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () => Navigator.pop(context, false),
                                                        child: const Text('Close'),
                                                      ),

                                                    ],
                                                  ),
                                                );
                                                if (result == null || !result) {
                                                  return;
                                                }

                                              },
                                              child: Icon(
                                                Icons.remove_red_eye,
                                                color: Color.fromRGBO(08, 134, 167, 1),
                                              ),
                                            ),
                                          ],
                                        )),

                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }


  // Future<void> showConfirmDialog(BuildContext context, String remarksSubmitted) async {
  //   bool confirmed = await _showConfirmation.showConfirmation(context);
  //   if (confirmed) {
  //     Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //             builder: (context) => data[widget.serviceIndex]['fee'] > 0
  //                 ? service_feeChallan(serviceIndex: widget.serviceIndex)
  //                 : ServiceFinalSubmit(serviceIndex: widget.serviceIndex, remarks: remarksSubmitted,)));
  //   }
  // }



}

