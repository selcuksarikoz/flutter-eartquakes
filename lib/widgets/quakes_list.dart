import 'package:evaluate/models/earth_quake_item.dart';
import 'package:evaluate/services/list_service.dart';
import 'package:evaluate/widgets/card_detail.dart';
import 'package:flutter/material.dart';

class QuakesList extends StatelessWidget {
  const QuakesList({super.key});

  Future<List<EarthQuakeItem>> getList() async {
    final response = await EarthQuakesService().getList("week");
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getList(),
      builder: (context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return const Expanded(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) =>
                  CardDetail(data: snapshot.data[index]));
        }
      },
    );
  }
}
