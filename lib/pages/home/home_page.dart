import 'package:evaluate/utils/colors.dart';
import 'package:evaluate/widgets/list_header.dart';
import 'package:evaluate/widgets/quakes_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor("#F5F5F5"),
        appBar: AppBar(
          toolbarHeight: 0,
          backgroundColor: Colors.transparent,
          elevation: 0,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.green,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness:
                Brightness.light, // status bar text color scheme
          ),
        ),
        body: Column(
          children: [ListHeader(), const Expanded(child: QuakesList())],
        ));
  }
}
