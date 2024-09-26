import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pm/auth/login_screen.dart';
import 'package:pm/auth/signup_provider.dart';
import 'package:pm/components/custom_appBar.dart';
import 'package:pm/components/custom_inputBox.dart';
import 'package:pm/constants/constants.dart';
import 'package:pm/constants/header.dart';
import 'package:pm/list_screen.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  TextEditingController accountName = TextEditingController();
  TextEditingController accountPassword = TextEditingController();
  TextEditingController accountEmail = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final objProvider = Provider.of<SignupProvider>(context);

    return Scaffold(
      appBar: CustomAppBar(),
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
              color: Colors.white.withOpacity(0.5),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    Text(
                      "Provide details of your accounts to be kept safe in wallet.",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomInputbox(
                      userNameController: accountName,
                      title: 'Account Name',
                      icon: Icon(Icons.person),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomInputbox(
                      userNameController: accountEmail,
                      title: 'Account Username',
                      icon: Icon(Icons.person),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomInputbox(
                      userNameController: accountPassword,
                      title: 'Account Password',
                      icon: Icon(Icons.password),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Consumer<SignupProvider>(builder:(context, vm,child){
                      return vm.isLoading?CircularProgressIndicator():InkWell(
                        onTap: () {
                          objProvider.saveData(
                            context,
                            accountName,
                            accountEmail,
                            accountPassword
                          );
                          setState(() {
                            isLoading = vm.isLoading;
                          });
                        },
                         child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: const_color.btnColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text("Save to Wallet",
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                      );

                    } ),

                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
