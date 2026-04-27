import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_1/screens/cartScreen/CartScreen.dart';
import 'package:test_1/screens/detail_page/components/ColorDot.dart';
import 'package:test_1/screens/detail_page/components/description.dart';

class Detailedpage extends ConsumerStatefulWidget {
  final int id;
  final Color color;
  final String title;
  final double price;
  final String sizee;
  final String description;
  final String image;
  const Detailedpage({
    super.key,
    required this.id,
    required this.color,
    required this.title,
    required this.price,
    required this.sizee,
    required this.description,
    required this.image,
  });

  @override
  ConsumerState<Detailedpage> createState() => _DetailedpageState();
}

class _DetailedpageState extends ConsumerState<Detailedpage> {
  int amount = 1;

  void _incrementCounter() {
    setState(() {
      amount++;
    });
  }

  void _decrement() {
    setState(() {
      if (amount > 0) {
        amount--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final white = Colors.white;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: white,
        backgroundColor: widget.color,
        elevation: 0,
      ),
      backgroundColor: widget.color,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height,
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: size.height * 0.3),
                    padding: EdgeInsets.only(
                      top: size.height * 0.12,
                      left: 20,
                      right: 20,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: Column(
                      children: [
                        ColorAndSize(sizee: widget.sizee),
                        SizedBox(height: 20),
                        Description(description: widget.description),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Iconbutton(
                                  icon: Icon(Icons.remove),
                                  onPressed: _decrement,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  child: Text(
                                    amount.toString(),
                                    style: Theme.of(
                                      context,
                                    ).textTheme.titleLarge,
                                  ),
                                ),
                                Iconbutton(
                                  icon: Icon(Icons.add),
                                  onPressed: _incrementCounter,
                                ),
                              ],
                            ),
                            Container(
                              height: 32,
                              width: 32,
                              decoration: BoxDecoration(
                                color: Color(0xFFFF6464),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.favorite,
                                color: Colors.white,
                                size: 16,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 20),
                              height: 50,
                              width: 58,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                border: Border.all(color: widget.color),
                              ),
                              child: IconButton(
                                icon: Icon(
                                  Icons.add_shopping_cart,
                                  color: widget.color,
                                ),
                                onPressed: () {},
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                height: 50,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: widget.color,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            Cartscreen(amount: amount),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    "Buy  Now".toUpperCase(),
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ).copyWith(top: size.height * 0.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Aristocratic Hand Bag",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          widget.title,
                          style: Theme.of(context).textTheme.headlineMedium
                              ?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(text: "Price\n"),
                                  TextSpan(
                                    text: "\$${widget.price}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium
                                        ?.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: Hero(
                                tag: "${widget.id}",
                                child: Image.asset(
                                  widget.image,
                                  height: 250,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Iconbutton extends StatelessWidget {
  final Icon icon;
  final void Function() onPressed;

  const Iconbutton({super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(25),
      ),
      child: IconButton(onPressed: onPressed, icon: icon),
    );
  }
}

class ColorAndSize extends StatelessWidget {
  const ColorAndSize({super.key, required this.sizee});

  final String sizee;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Color"),
            SizedBox(height: 10),
            Row(
              children: [
                ColorDot(color: Colors.brown, isSelected: true),
                SizedBox(width: 10),
                ColorDot(color: Colors.blueAccent, isSelected: false),
                SizedBox(width: 10),
                ColorDot(color: Colors.red, isSelected: false),
              ],
            ),
          ],
        ),
        SizedBox(width: 100),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Size'),
            SizedBox(height: 5),
            Text(
              sizee,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}
