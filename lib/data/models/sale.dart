import 'package:flutter/cupertino.dart';
import 'package:provider_structure/data/models/cart.dart';
import 'package:provider_structure/data/models/sku/sku.dart';

class SaleModel extends ChangeNotifier {
  final List<Cart> _carts = [];

  get carts => _carts;

  void addCart(Cart cart) {
    _carts.add(cart);
    notifyListeners();
  }

  void removeCart(Cart cart) {
    _carts.remove(cart);
    notifyListeners();
  }

  addSkuToCart({required Cart cart, required SKU sku}) {
    cart.add(sku: sku);
    notifyListeners();
  }

  removeSkuFromCart({required Cart cart, required SKU sku}) {
    cart.remove(sku: sku);
    notifyListeners();
  }

  increaseSkuQuantity({required Cart cart, required SKU sku}) {
    cart.increment(sku: sku);
    notifyListeners();
  }
}
