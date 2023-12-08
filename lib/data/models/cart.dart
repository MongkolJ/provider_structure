import 'package:flutter/cupertino.dart';
import 'package:provider_structure/data/models/sku/sku.dart';
import 'package:uuid/uuid.dart';

class Cart extends ChangeNotifier {
  final String id = const Uuid().v4();
  final List<SKU> _items = [];

  get items => _items;

  void add({required SKU sku}) {
    _items.add(sku);
    notifyListeners();
  }

  void remove({required SKU sku}) {
    _items.remove(sku);
    notifyListeners();
  }

  void increment({required SKU sku}) {
    sku.increase();
    notifyListeners();
  }

  void decrement({required SKU sku}) {
    bool isDecreased = sku.tryDecrease();
    if (isDecreased) {
      notifyListeners();
    }
  }

  double get totalPrice {
    return _items.fold(0, (total, current) => total + current.totalPrice);
  }

  double get totalQuantity {
    return _items.fold(0, (total, current) => total + current.quantity);
  }
}
