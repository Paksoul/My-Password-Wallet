import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HeaderText extends StatelessWidget {
  const HeaderText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
                text:"My\n",
                style:GoogleFonts.luckiestGuy(
                    fontSize: 20.sp,
                  color: Colors.orange,)
            ),
            TextSpan(
              text: 'P',
              style: GoogleFonts.luckiestGuy(
                fontSize: 30.sp,
                color: Color.fromRGBO(08, 134, 167, 1),
              )
            ),
            // Rest of the "PASSWORD"
            TextSpan(
              text: 'ASSWORD ',
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
              ),
            ),
            // First letter 'W' of "WALLET"
            TextSpan(
              text: 'W',
              style: GoogleFonts.luckiestGuy(
                fontSize: 30.sp,
                color: Color.fromRGBO(08, 134, 167, 1),
              ),
            ),
            // Rest of the "WALLET"
            TextSpan(
              text: 'ALLET',
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
