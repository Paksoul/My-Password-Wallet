import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pm/auth/signup_provider.dart';
import 'package:provider/provider.dart';

class SignUp_screen extends StatefulWidget {
  const SignUp_screen({super.key});

  @override
  State<SignUp_screen> createState() => _SignUp_screenState();
}

class _SignUp_screenState extends State<SignUp_screen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final objProvider = Provider.of<SignupProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
        width: MediaQuery.of(context).size.width, // Full screen width
    height: MediaQuery.of(context).size.height,

    decoration: BoxDecoration(
    image: DecorationImage(
    image: AssetImage('assets/6412173.jpg'), fit: BoxFit.fill),
    ),
          child: Container(
            width: MediaQuery.of(context).size.width, // Full screen width
            height: MediaQuery.of(context).size.height,

            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.6 )
            ),

            child: Padding(
              padding: const EdgeInsets.only(top: 70.0, left: 20, right: 20),
              child: Column(children: [
                Lottie.asset('assets/Animation - 1724329283336.json'),
                custom_inputBox(
                  userNameController: nameController,
                  title: 'Username',
                  icon: Icon(Icons.person),
                ),
                SizedBox(
                  height: 10,
                ),
                custom_inputBox(
                  userNameController: contactController,
                  title: 'Mobile No',
                  icon: Icon(Icons.phone),
                ),
                SizedBox(
                  height: 10,
                ),
                custom_inputBox(
                  userNameController: passwordController,
                  title: 'Password',
                  icon: Icon(Icons.password),
                ),
                SizedBox(
                  height: 10,
                ),
                custom_inputBox(
                  userNameController: emailController,
                  title: 'Email',
                  icon: Icon(Icons.email),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    objProvider.signup(
                        context,
                        emailController,
                        passwordController,
                        nameController,
                        contactController
                    );
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child:
                          Text("Sign up", style: TextStyle(color: Colors.white)),
                    ),
                  ),
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}

class custom_inputBox extends StatelessWidget {
  const custom_inputBox({
    super.key,
    required this.userNameController,
    required this.title,
    required this.icon,
  });

  final TextEditingController userNameController;
  final String title;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: TextField(
        controller: userNameController,
        decoration: InputDecoration(
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
            prefixIcon: icon,
            prefixIconColor: Colors.blue,
            hintText: title,
            hintStyle: TextStyle(color: Colors.grey),
            border: InputBorder.none),
      ),
    );
  }
}
