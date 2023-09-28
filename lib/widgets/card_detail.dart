import 'package:evaluate/screens/detail/detail_screen.dart';
import 'package:evaluate/utils/colors.dart';
import 'package:evaluate/utils/format_date.dart';
import 'package:evaluate/utils/mag_colors.dart';
import 'package:flutter/material.dart';
import 'package:evaluate/models/earth_quake_item.dart';
import 'package:google_fonts/google_fonts.dart';

class CardDetail extends StatelessWidget {
  const CardDetail({super.key, required this.data});

  final EarthQuakeItem data;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DetailScreen(detail: data)));
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: HexColor("#ffffff")),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // şiddet
              Text(data.mag.toString(),
                  style: GoogleFonts.ibmPlexMono(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: MagColors.getMagColors(
                        double.parse(data.mag.toString())),
                  )),

              const SizedBox(
                width: 10,
              ),

              // açıklamalar
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 250,
                    child: Text(
                      data.location.toString(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.ibmPlexSans(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  const Divider(
                    color: Colors.grey,
                    height: 10,
                    indent: 10,
                    endIndent: 10,
                    thickness: 1,
                  ),
                  texts(data.time)
                ],
              )

              // harita
            ]),
      ),
    );
  }

  Widget texts(int currentDate) {
    final FormatDate dt = FormatDate(currentTime: currentDate);
    final String date = dt.getFormatted("dd/MM/yyyy");
    final String hour = dt.getFormatted("HH:mm");

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        columTexts("TARİH", date),
        const SizedBox(
          width: 20,
        ),
        columTexts("SAAT", hour),
        const SizedBox(
          width: 20,
        ),
        columTexts("DERİNLİK", data.mag.toString())
      ],
    );
  }

  Widget columTexts(String title, String desc) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: GoogleFonts.ibmPlexSans(fontSize: 12)),
        Text(
          desc,
          style: GoogleFonts.ibmPlexSans(
              fontSize: 14, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
