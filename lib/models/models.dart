import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';

class BagItem {
  final int id;
  final String title;
  final double price;
  final String size;
  final String description;
  final String image;
  final Color color;

  BagItem({
    required this.id,
    required this.title,
    required this.price,
    required this.size,
    required this.description,
    required this.image,
    required this.color,
  });
}

final List<BagItem> initialBagData = [
  BagItem(
    id: 101,
    title: "Classic Leather Tote",
    price: 149.99,
    size: "Large",
    description:
        "A timeless large leather tote, perfect for work or weekend errands. Features an interior zip pocket and magnetic closure.",
    image: "assets/brownBag.png",
    color: Colors.brown,
  ),
  BagItem(
    id: 102,
    title: "Sporty Nylon Backpack",
    price: 89.99,
    size: "Medium",
    description:
        "Durable and lightweight nylon backpack with a padded laptop sleeve and multiple external pockets for organization.",
    image: "assets/blackBag.png",
    color: Colors.grey,
  ),
  BagItem(
    id: 103,
    title: "Elegant Crossbody",
    price: 75.50,
    size: "Small",
    description:
        "A sleek and compact crossbody bag, ideal for nights out. Features a stylish gold-tone chain strap and a secure twist-lock flap.",
    image: "assets/blueBag.png",
    color: Color(0xFF3775A4),
  ),
  BagItem(
    id: 104,
    title: "Canvas Weekender Duffle",
    price: 110.00,
    size: "X-Large",
    description:
        "The perfect oversized duffle for a short getaway. Made from sturdy canvas with reinforced leather handles.",
    image: "assets/greenBag.png",
    color: const Color.fromARGB(255, 31, 170, 31),
  ),
  BagItem(
    id: 105,
    title: "Suede Shoulder Bag",
    price: 120.00,
    size: "Medium",
    description:
        "A chic, bohemian-style shoulder bag made from soft suede with fringe details and a roomy main compartment.",
    image: "assets/beigeBag.png",
    color: Color(0xFF8D6E63),
  ),
  BagItem(
    id: 106,
    title: "Compact Belt Bag",
    price: 45.00,
    size: "Small",
    description:
        "A trendy and practical belt bag (fanny pack) to keep your essentials close and your hands free. Adjustable strap.",
    image: "assets/redBag.png",
    color: const Color.fromARGB(255, 210, 77, 68),
  ),
];

final List<BagItem> _initialCartItem = [];

class BagItemNotifier extends StateNotifier<List<BagItem>> {
  BagItemNotifier() : super(initialBagData);
}

class CartItemNotifier extends StateNotifier<List<BagItem>> {
  CartItemNotifier() : super(_initialCartItem);

  void addToCart(BagItem item) {
    state = [...state, item];
  }

  void removeFromCart(BagItem item) {
    state = state.where((element) => element.id != item.id).toList();
  }
}
