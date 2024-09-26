import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pm/auth/login_screen.dart';
import 'package:pm/constants/constants.dart';
import 'package:pm/constants/header.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [

          SizedBox(height: 5.h),

        HeaderText(),


          SizedBox(height: 5.h,),
          SizedBox(height:200,child: Lottie.asset('assets/Animation - 1724904772483.json')),
          SizedBox(height: 2.h,),
          Padding(
            padding: const EdgeInsets.all(28.0),
            child: Text(
                'Securely store, manage, and access your passwords and sensitive information all in one place with advanced encryption and ease.',
              style: TextStyle(
                fontSize: 16.sp,
              ),
            ),
          ),
          SizedBox(height: 2.h,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 38.0),
            child: InkWell(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx)=>LoginScreen()));
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: const_color.btnColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child:
                  Text("Get Start", style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
          ),
          SizedBox(height: 5.h),
          // Key Features Description (optional)



        ],
      ),

    );
  }
}

