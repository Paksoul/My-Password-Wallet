import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:pm/auth/signup_provider.dart';
import 'package:pm/auth/signup_screen.dart';
import 'package:pm/components/custom_inputBox.dart';
import 'package:pm/constants/constants.dart';
import 'package:pm/constants/header.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final objProvider = Provider.of<SignupProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 70.0, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
            HeaderText(),

            SizedBox(height: 5.h,),
            SizedBox(height:25.h,child: Lottie.asset('assets/Animation - 1724329283336.json')),
                SizedBox(
                  height: 10.h,
                ),
                CustomInputbox(
              userNameController: emailController,
              title: 'Email',
              icon: Icon(Icons.email),
            ),
            SizedBox(
              height: 10,
            ),
            CustomInputbox(
              userNameController: passwordController,
              title: 'Password',
              password: true,
              icon: Icon(Icons.password),
            ),
            SizedBox(
              height: 10,
            ),
                Consumer<SignupProvider>(builder:(context, vm,child){
                  return vm.isLoading?CircularProgressIndicator():InkWell(
                    onTap: () {
                      objProvider.login(
                        context,
                        emailController,
                        passwordController,
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
                        child:
                        Text("Unlock My Wallet", style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  );

                } ),

            SizedBox(height: 5.h,),

                Text("OR", style: TextStyle(fontSize: 20),),
            SizedBox(height: 5.h,),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp_screen()));
              },
              child:
                  Text("Create Account", style: TextStyle(color: Colors.blue)),

            ),

          ]),
        ),
      ),
    );
  }
}
