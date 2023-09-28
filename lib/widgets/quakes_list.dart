import 'package:evaluate/providers/earth_quakes_list_provider.dart';
import 'package:evaluate/widgets/card_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuakesList extends ConsumerWidget {
  const QuakesList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(earthQuakesListProvider);

    return data.when(
        data: (data) => ListView.builder(
            shrinkWrap: true,
            itemCount: data.length,
            itemBuilder: (context, index) => CardDetail(data: data[index])),
        error: (error, stackTrace) => const Text("data yok"),
        loading: () => const Center(child: CircularProgressIndicator()));
  }
}
