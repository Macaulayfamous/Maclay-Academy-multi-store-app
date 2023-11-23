import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedSizeProvider =
    StateNotifierProvider<SelectedSizeNotifier, String>(
  (ref) {
    return SelectedSizeNotifier();
  },
);

class SelectedSizeNotifier extends StateNotifier<String> {
  SelectedSizeNotifier() : super("");

  void setSelectedSize(String size) {
    state = size;
  }
}