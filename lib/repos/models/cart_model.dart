import 'dart:convert';

class Carts {
  final int? id;
  final List<CartProduct>? products;
  final int? total;
  final int? discountedTotal;
  final int? userId;
  final int? totalProducts;
  final int? totalQuantity;

  Carts({
    this.id,
    this.products,
    this.total,
    this.discountedTotal,
    this.userId,
    this.totalProducts,
    this.totalQuantity,
  });

  Carts copyWith({
    int? id,
    List<CartProduct>? products,
    int? total,
    int? discountedTotal,
    int? userId,
    int? totalProducts,
    int? totalQuantity,
  }) =>
      Carts(
        id: id ?? this.id,
        products: products ?? this.products,
        total: total ?? this.total,
        discountedTotal: discountedTotal ?? this.discountedTotal,
        userId: userId ?? this.userId,
        totalProducts: totalProducts ?? this.totalProducts,
        totalQuantity: totalQuantity ?? this.totalQuantity,
      );

  factory Carts.fromJson(Map<String, dynamic> json) => Carts(
        id: json["id"],
        products: json["products"] == null
            ? []
            : List<CartProduct>.from(
                json["products"]!.map((x) => CartProduct.fromJson(x))),
        total: json["total"],
        discountedTotal: json["discountedTotal"],
        userId: json["userId"],
        totalProducts: json["totalProducts"],
        totalQuantity: json["totalQuantity"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "products": products == null
            ? []
            : List<dynamic>.from(products!.map((x) => x.toJson())),
        "total": total,
        "discountedTotal": discountedTotal,
        "userId": userId,
        "totalProducts": totalProducts,
        "totalQuantity": totalQuantity,
      };
}

class CartProduct {
  final int? id;
  final String? title;
  final int? price;
  final int? quantity;
  final int? total;
  final double? discountPercentage;
  final int? discountedPrice;
  final String? thumbnail;

  CartProduct({
    this.id,
    this.title,
    this.price,
    this.quantity,
    this.total,
    this.discountPercentage,
    this.discountedPrice,
    this.thumbnail,
  });

  CartProduct copyWith({
    int? id,
    String? title,
    int? price,
    int? quantity,
    int? total,
    double? discountPercentage,
    int? discountedPrice,
    String? thumbnail,
  }) =>
      CartProduct(
        id: id ?? this.id,
        title: title ?? this.title,
        price: price ?? this.price,
        quantity: quantity ?? this.quantity,
        total: total ?? this.total,
        discountPercentage: discountPercentage ?? this.discountPercentage,
        discountedPrice: discountedPrice ?? this.discountedPrice,
        thumbnail: thumbnail ?? this.thumbnail,
      );

  factory CartProduct.fromRawJson(String str) =>
      CartProduct.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CartProduct.fromJson(Map<String, dynamic> json) => CartProduct(
        id: json["id"],
        title: json["title"],
        price: json["price"],
        quantity: json["quantity"],
        total: json["total"],
        discountPercentage: json["discountPercentage"]?.toDouble(),
        discountedPrice: json["discountedPrice"],
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "quantity": quantity,
        "total": total,
        "discountPercentage": discountPercentage,
        "discountedPrice": discountedPrice,
        "thumbnail": thumbnail,
      };
}
