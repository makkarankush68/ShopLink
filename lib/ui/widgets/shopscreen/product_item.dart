import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
class ProductItem extends StatefulWidget {
  final String image;
  final String label;
  final double price;
  final double rating;
  final int ratingCount;
  final String offer;

  const ProductItem({
    super.key,
    required this.image,
    required this.label,
    required this.price,
    required this.rating,
    required this.ratingCount,
    required this.offer,
  });

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  bool isFav = false;

  void favToggle() {
    setState(() {
      isFav = !isFav;
      // if (isFav) {
      //   Fluttertoast.showToast(
      //       msg: "Item Added to Favorites",
      //       fontSize: 18,
      //       timeInSecForIosWeb: 1,
      //       toastLength: Toast.LENGTH_SHORT,
      //       gravity: ToastGravity.CENTER);
      // } else {
      //   Fluttertoast.showToast(
      //       msg: "Item Removed From Favorites",
      //       fontSize: 18,
      //       timeInSecForIosWeb: 1,
      //       toastLength: Toast.LENGTH_SHORT,
      //       gravity: ToastGravity.CENTER);
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: favToggle,
      child: Card(
        color: Colors.white,
        elevation: 3,
        // margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                Image.asset(
                  widget.image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 120,
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: IconButton(
                    icon: !isFav
                        ? const Icon(
                            Icons.favorite_border,
                            color: Colors.grey,
                          )
                        : const Icon(
                            Icons.favorite,
                            color: Colors.redAccent,
                          ),
                    onPressed: favToggle,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.label,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        '${widget.rating} (${widget.ratingCount} ratings)',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '₹${widget.price}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.offer,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.green,
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
/**
 *  Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: const Color.fromARGB(18, 0, 0, 0))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                Image.asset(
                  widget.image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 120,
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: IconButton(
                    icon: !isFav
                        ? const Icon(
                            Icons.favorite_border,
                            color: Colors.grey,
                          )
                        : const Icon(
                            Icons.favorite,
                            color: Colors.redAccent,
                          ),
                    onPressed: favToggle,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.label,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        '${widget.rating} (${widget.ratingCount} ratings)',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '₹${widget.price}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.offer,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
 */