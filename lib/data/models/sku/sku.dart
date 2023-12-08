class SKU {
  late String sku;
  late String name;
  late double price;
  late int quantity;

  SKU({
    required this.sku,
    required this.name,
    required this.price,
    required this.quantity,
  });

  SKU.fromJson(Map<String, dynamic> json) {
    sku = json['sku'];
    name = json['name'];
    price = json['price'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['sku'] = sku;
    data['name'] = name;
    data['price'] = price;
    data['quantity'] = quantity;

    return data;
  }

  void increase() {
    quantity++;
  }

  bool tryDecrease() {
    if (quantity > 1) {
      quantity--;
      return true;
    }
    return false;
  }

  double get totalPrice {
    return price * quantity;
  }
}
