import 'package:evaluate/providers/earth_quakes_list_provider.dart';
import 'package:evaluate/services/list_service.dart';
import 'package:evaluate/widgets/card_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class QuakesList extends ConsumerWidget {
  const QuakesList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(earthQuakesListProvider);

    Future<void> handleRefresh() async {
      ref.refresh(listProvider).getList("week");
    }

    return LiquidPullToRefresh(
      showChildOpacityTransition: false,
      animSpeedFactor: 7.0,
      onRefresh: handleRefresh, // refresh callback
      child: data.when(
          data: (data) => ListView.builder(
              shrinkWrap: true,
              itemCount: data.length,
              itemBuilder: (context, index) => CardDetail(data: data[index])),
          error: (error, stackTrace) => const Center(child: Text("data yok")),
          loading: () =>
              const Center(child: CircularProgressIndicator())), // scroll view
    );
  }
}
