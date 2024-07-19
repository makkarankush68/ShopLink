import 'package:flutter/material.dart';
import '../widgets/shopscreen/all_items_list.dart';
import '../widgets/filter_row.dart';
import '../widgets/shopscreen/offer_crousel.dart';
import '../../utils/type_shop.dart';

class ShopScreen extends StatefulWidget {
  final TypeShop shop;

  const ShopScreen({required this.shop, super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          automaticallyImplyLeading: false,
          toolbarHeight: 0,
        ),
        body: ListView(
          padding: const EdgeInsets.all(8.0),
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                            alignment: Alignment.topLeft,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.arrow_back_ios)),
                      ],
                    )),
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.search)),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.favorite_border_rounded)),
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.share_sharp)),
                  ],
                ),
                Text(
                  widget.shop.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  '${widget.shop.category} • ${widget.shop.description} • ₹${widget.shop.price} for one',
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 2, horizontal: 4),
                      decoration: const BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Row(
                        children: [
                          Text(
                            '${widget.shop.rating} ',
                            style: const TextStyle(
                                fontSize: 16, color: Colors.white),
                          ),
                          const Icon(
                            Icons.star,
                            color: Colors.white,
                            size: 15,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      '350 ratings',
                      style: TextStyle(
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                          height: 1.2,
                          decorationStyle: TextDecorationStyle.dotted),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15))),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(Icons.timer, color: Colors.green),
                      const SizedBox(width: 8),
                      Text(
                        '${widget.shop.deliveryTime} mins • ${widget.shop.distance} km',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),

                // Carousel
                const OfferCrousel(),

                // Tabs
                TabBar(
                  labelColor: Colors.blue,
                  dividerColor: Colors.transparent,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: const BoxDecoration(
                    color: Color.fromARGB(222, 255, 214, 64),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  onTap: (index) {
                    setState(() {});
                  },
                  tabs: const [
                    Tab(
                      child: Text(
                        'Products',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Services',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Sales',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 8),
                const FilterRow(),
                const SizedBox(height: 8),
                const Divider(),
              ],
            ),
            const SizedBox(
              // height: MediaQuery.of(context).size.height * 1.5,
              height: 1200,
              child: TabBarView(
                children: [
                  AllItemList(),
                  AllItemList(),
                  AllItemList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
