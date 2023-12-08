import 'package:provider_structure/data/models/sale.dart';

import '../../data/models/cart.dart';

class SaleViewModel {
  SaleModel model;

  SaleViewModel({required this.model});

  void addCart() {
    model.addCart(Cart());
  }
}
