import 'package:evaluate/models/earth_quake_item.dart';
import 'package:evaluate/services/list_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final earthQuakesListProvider =
    FutureProvider<List<EarthQuakeItem>>((ref) async {
  return ref.watch(listProvider).getList("week");
});
