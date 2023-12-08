import 'package:provider_structure/data/models/cart.dart';
import 'package:provider_structure/data/models/sku/sku.dart';

class CartViewModel {
  Cart cart;

  CartViewModel({required this.cart});

  Future<void> onUserAddNewSku() async {
    cart.add(sku: SKU(name: 'SKU', price: 10, sku: '', quantity: 1));
  }

  Future<void> onUserIncreaseSkuQuantity(SKU sku) async {
    cart.increment(sku: sku);
  }

  Future<void> onUserDecreaseSkuQuantity(SKU sku) async {
    cart.decrement(sku: sku);
  }
}
