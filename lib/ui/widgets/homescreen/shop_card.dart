import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kmdha/ui/screens/shop_screen.dart';
import '../../../utils/type_shop.dart';

class ShopCard extends StatefulWidget {
  final TypeShop shop;

  const ShopCard({required this.shop, super.key});

  @override
  State<ShopCard> createState() => _ShopCardState();
}

class _ShopCardState extends State<ShopCard> {
  bool isFav = false;
  bool ishidden = false;

  void favToggle() {
    setState(() {
      isFav = !isFav;
      // if (isFav) {
      //   Fluttertoast.showToast(
      //       msg: "Shop Added to Favorites",
      //       fontSize: 18,
      //       timeInSecForIosWeb: 1,
      //       toastLength: Toast.LENGTH_SHORT,
      //       gravity: ToastGravity.CENTER);
      // } else {
      //   Fluttertoast.showToast(
      //       msg: "Shop Removed From Favorites",
      //       fontSize: 18,
      //       timeInSecForIosWeb: 1,
      //       toastLength: Toast.LENGTH_SHORT,
      //       gravity: ToastGravity.CENTER);
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return !ishidden
        ? GestureDetector(
            onTap: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ShopScreen(shop: widget.shop),
                  )),
            },
            onDoubleTap: favToggle,
            child: Card(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              elevation: 6.0,
              shadowColor: Colors.grey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(10))),
                        child: Image.network(
                          widget.shop.imageUrl,
                          height: 180,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 8.0,
                        child: Row(
                          children: [
                            IconButton(
                              icon: !isFav
                                  ? const Icon(
                                      Icons.favorite_border,
                                      color: Colors.white,
                                    )
                                  : const Icon(
                                      Icons.favorite,
                                      color: Colors.redAccent,
                                    ),
                              onPressed: favToggle,
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.visibility_off,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  ishidden = !ishidden;
                                  Fluttertoast.showToast(
                                      msg: "The Shop is now Hidden",
                                      fontSize: 18,
                                      timeInSecForIosWeb: 1,
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER);
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                          bottom: 0,
                          left: 0,
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Color(0xfff7f2fa),
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10))),
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Row(
                                children: [
                                  const Icon(Icons.timer,
                                      size: 16, color: Colors.green),
                                  const SizedBox(width: 4),
                                  Text(
                                      '${widget.shop.deliveryTime} mins • ${widget.shop.distance} km',
                                      style: const TextStyle(
                                          fontSize: 12, color: Colors.green)),
                                ],
                              ),
                            ),
                          ))
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                        color: Color(0xfff7f2fa),
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(10))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.shop.name,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4.0),
                        Text(
                          '${widget.shop.category} • ${widget.shop.description} • ₹${widget.shop.price} for one',
                          style:
                              TextStyle(fontSize: 14, color: Colors.grey[600]),
                        ),
                        const Divider(
                          height: 18,
                          thickness: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 8),
                              child: Text(
                                widget.shop.discount,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 8),
                              child: Row(
                                children: [
                                  Text(
                                    "${widget.shop.rating} ",
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                  const Icon(Icons.star,
                                      color: Colors.white, size: 12),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        : const SizedBox();
  }
}
