import 'package:flutter_riverpod/legacy.dart';
import 'package:test_1/models/models.dart';

final bagItemProvider = StateNotifierProvider<BagItemNotifier, List<BagItem>>((
  ref,
) {
  return BagItemNotifier();
});

final cartItemProvider = StateNotifierProvider<CartItemNotifier, List<BagItem>>(
  (ref) {
    return CartItemNotifier();
  },
);
