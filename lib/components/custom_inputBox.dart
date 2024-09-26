import 'package:flutter/material.dart';

class CustomInputbox extends StatelessWidget {
  const CustomInputbox({
    super.key,
    required this.userNameController,
    required this.title,
     bool this.password=false,
    required this.icon,
  });

  final TextEditingController userNameController;
  final String title;
  final Icon icon;
  final bool password;

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
        obscureText: password,
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