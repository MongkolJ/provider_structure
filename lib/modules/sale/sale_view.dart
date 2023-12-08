import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_structure/data/models/cart.dart';
import 'package:provider_structure/data/models/sale.dart';
import 'package:provider_structure/data/models/sku/sku.dart';
import 'package:provider_structure/modules/sale/sale_view_model.dart';

import '../cart/cart_view.dart';

class SaleView extends StatefulWidget {
  const SaleView({super.key});

  @override
  State<SaleView> createState() => _SaleViewState();
}

class _SaleViewState extends State<SaleView> {
  late SaleViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = SaleViewModel(model: context.read<SaleModel>());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Consumer<SaleModel>(
          builder: (context, saleModel, child) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: context.watch<SaleModel>().carts.length,
                    itemBuilder: (context, index) {
                      Cart cart = context.watch<SaleModel>().carts[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CartView(
                                cart: cart,
                              ),
                            ),
                          );
                        },
                        child: ListTile(
                          leading: IconButton(
                            onPressed: () {
                              SKU sku = SKU(
                                sku: 'asd',
                                name: 'test',
                                price: 10,
                                quantity: 1,
                              );
                              _viewModel.model.addSkuToCart(
                                cart: cart,
                                sku: sku,
                              );
                            },
                            icon: const Icon(Icons.add),
                          ),
                          title: Text(cart.id),
                          subtitle: Text(cart.totalPrice.toString()),
                          trailing: IconButton(
                            onPressed: () {
                              saleModel.removeCart(cart);
                            },
                            icon: const Icon(Icons.delete),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Cart cart = Cart();
                    _viewModel.addCart();
                  },
                  child: const Text('Add Cart'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
