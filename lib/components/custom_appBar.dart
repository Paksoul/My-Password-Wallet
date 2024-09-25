import 'package:flutter/material.dart';
import 'package:pm/UI/logout.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(60); // Set your desired height

  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        InkWell(
          onTap: () {
            showLogoutBottomSheet(context);
          },
          child: Row(
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
