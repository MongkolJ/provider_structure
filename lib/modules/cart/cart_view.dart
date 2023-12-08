import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_structure/data/models/cart.dart';
import 'package:provider_structure/data/models/sku/sku.dart';
import 'package:provider_structure/modules/cart/cart_view_model.dart';

class CartView extends StatefulWidget {
  const CartView({super.key, required this.cart});
  final Cart cart;
  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  late CartViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = CartViewModel(cart: widget.cart);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => _viewModel.cart),
        ],
        child: Column(
          children: [
            Expanded(
              child: Consumer<Cart>(
                builder: (context, cart, child) {
                  return ListView.builder(
                    itemCount: cart.items.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(cart.items[index].name),
                        subtitle: Text(cart.items[index].price.toString()),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                _viewModel.onUserIncreaseSkuQuantity(
                                    cart.items[index]);
                              },
                              icon: const Icon(Icons.add),
                            ),
                            Text(cart.items[index].quantity.toString()),
                            IconButton(
                              onPressed: () {
                                _viewModel.onUserDecreaseSkuQuantity(
                                    cart.items[index]);
                              },
                              icon: const Icon(Icons.remove),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            IconButton(
              onPressed: () {
                _viewModel.onUserAddNewSku();
              },
              icon: const Icon(Icons.add),
            ),
            Consumer<Cart>(
              builder: (context, cart, child) {
                return Text(cart.totalPrice.toString());
              },
            ),
          ],
        ),
      ),
    );
  }
}
