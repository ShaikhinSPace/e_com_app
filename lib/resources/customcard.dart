import 'package:e_com_app/features/screens/Product/ProductScreen.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  final String name;

  final int price;
  final String discountedprice;
  final int discountPercent;
  final String image;
  final String rating;
  const CustomCard(
      {super.key,
      required this.name,
      required this.discountPercent,
      required this.discountedprice,
      required this.image,
      required this.price,
      required this.rating});

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState<T extends CustomCard> extends State<T> {
  Widget buildCard() {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ProductScreen()));
      },
      child: buildCardnonTap(),
    );
  }

  Widget buildCardnonTap() {
    return Card(
      surfaceTintColor: Colors.blueGrey,
      shadowColor: Colors.white,
      elevation: 3,
      color: Colors.white,
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Stack(
              children: [
                // Positioned.fill(right: 130, child: buildDiscount()),
                SizedBox(
                    height: 100,
                    width: 200,
                    child: Image.network(
                      widget.image,
                      fit: BoxFit.contain,
                    )),
              ],
            ),
            Text(widget.name),
            Row(
              children: [
                const Icon(
                  Icons.star,
                  size: 15,
                  color: Color.fromARGB(255, 255, 187, 0),
                ),
                Text(
                  "${widget.rating}/5",
                  style: const TextStyle(fontSize: 10),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "\$ ${widget.discountedprice.toString()}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  '\$ ${widget.price}',
                  style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w700,
                      decoration: TextDecoration.lineThrough),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildDiscount() {
    return CircleAvatar(
      radius: 20,
      backgroundColor: Colors.red,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            '${widget.discountPercent}% off',
            style: const TextStyle(color: Colors.yellow, fontSize: 10),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildCard();
  }
}
