import 'package:evaluate/utils/colors.dart';
import 'package:evaluate/utils/image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ListHeader extends StatelessWidget {
  final DateTime dateNow;

  ListHeader({
    super.key,
  }) : dateNow = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              ImageEnums.logo.getPath,
              width: 40,
              height: 40,
              fit: BoxFit.contain,
            ),
            const SizedBox(
              width: 15,
            ),
            Text(
              "Son Depremler".toUpperCase(),
              style: GoogleFonts.ibmPlexSans(
                  fontSize: 18,
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black)),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    DateFormat("HH:mm").format(dateNow),
                    style: GoogleFonts.ibmPlexSans(
                        fontSize: 21, color: Colors.black),
                  ),
                  Text(
                    DateFormat("dd MMMM, yyyy").format(dateNow),
                    style: GoogleFonts.ibmPlexSans(
                        fontSize: 12, color: HexColor("#8F8F8F")),
                  )
                ],
              ),
            )
          ]),
    );
  }
}
