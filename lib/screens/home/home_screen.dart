import 'package:evaluate/utils/colors.dart';
import 'package:evaluate/widgets/list_header.dart';
import 'package:evaluate/widgets/quakes_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor("#F5F5F5"),
        appBar: AppBar(
          toolbarHeight: 0,
          backgroundColor: Colors.transparent,
          elevation: 0,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.black87,
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness:
                Brightness.light, // status bar text color scheme
          ),
        ),
        body: Column(
          children: [ListHeader(), const Expanded(child: QuakesList())],
        ));
  }
}
