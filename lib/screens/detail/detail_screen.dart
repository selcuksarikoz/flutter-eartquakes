import 'package:circular_pulse/circular_pulse.dart';
import 'package:evaluate/models/earth_quake_item.dart';
import 'package:evaluate/utils/format_date.dart';
import 'package:evaluate/utils/image.dart';
import 'package:evaluate/utils/mag_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.detail});

  final EarthQuakeItem detail;

  @override
  Widget build(BuildContext context) {
    final Color color = MagColors.getMagColors(double.parse(detail.mag));
    final FormatDate dt = FormatDate(currentTime: detail.time);
    final String date = dt.getFormatted("dd/MM/yyyy");
    final String hour = dt.getFormatted("HH:mm");

    return Scaffold(
        appBar: AppBar(
          backgroundColor: color,
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          title(),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              "BüYÜKLÜK",
              style: GoogleFonts.ibmPlexSans(fontSize: 18),
            ),
          ),
          magDetail(color),
          const SizedBox(
            height: 20,
          ),
          otherDetails(date, hour),
          const SizedBox(
            height: 20,
          ),
          Expanded(
              child: Container(
            decoration: BoxDecoration(color: color),
          )),
          const SizedBox(
            height: 20,
          ),
        ]));
  }

  Padding otherDetails(String date, String hour) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        children: [
          Row(
            children: [
              detailTexts("TARİH", date),
              const SizedBox(
                width: 40,
              ),
              detailTexts("SAAT", hour),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              detailTexts("DERİNLİK", detail.depth + " KM"),
              const SizedBox(
                width: 40,
              ),
              detailTexts("ENLEM", detail.lat),
              const SizedBox(
                width: 40,
              ),
              detailTexts("BOYLAM", detail.long),
            ],
          ),
        ],
      ),
    );
  }

  Column detailTexts(String title, String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        const SizedBox(
          height: 5,
        ),
        Text(
          description,
          style: GoogleFonts.ibmPlexSans(
              fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }

  Padding magDetail(Color color) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        children: [
          CircularPulse(
            shape: BoxShape.circle,
            repeat: true,
            showTwoGlows: true,
            duration: const Duration(milliseconds: 2000),
            glowColor: color,
            endRadius: 30,
            child: Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                  color: color, borderRadius: BorderRadius.circular(16)),
            ),
          ),
          Text(
            detail.mag,
            style: GoogleFonts.ibmPlexMono(
                fontSize: 88,
                letterSpacing: 0,
                color: MagColors.getMagColors(double.parse(detail.mag))),
          )
        ],
      ),
    );
  }

  Padding title() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(ImageEnums.pin.getPath),
          Text(
            detail.location,
            style: GoogleFonts.ibmPlexSans(
                fontSize: 24, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
