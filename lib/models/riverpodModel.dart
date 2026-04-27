import 'package:flutter_riverpod/legacy.dart';
import 'package:test_1/models/models.dart';

final BagItemProvider = StateNotifierProvider<BagItemNotifier, List<BagItem>>((
  ref,
) {
  return BagItemNotifier();
});

final CartItemProvider = StateNotifierProvider<CartItemNotifier, List<BagItem>>(
  (ref) {
    return CartItemNotifier();
  },
);
