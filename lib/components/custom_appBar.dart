import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pm/UI/logout.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(60); // Set your desired height

  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title:     SizedBox(width:55.w,child: Text(FirebaseAuth.instance.currentUser!.email.toString(),overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 12),)),
      actions: [
        InkWell(
          onTap: () {
            showLogoutBottomSheet(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Logout"),
              Icon(
                Icons.logout_sharp,
              ),
              SizedBox(width: 30,)
            ],
          ),
        ),
      ],
    );
  }
}
