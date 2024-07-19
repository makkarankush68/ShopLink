import 'package:flutter/material.dart';
import 'package:kmdha/utils/list_of_shops.dart';
import '../widgets/filter_row.dart';
import '../widgets/productscreen/special_shop.dart';
import '../widgets/shopscreen/all_items_list.dart';

class ProductScreen extends StatefulWidget {
  final String label;
  const ProductScreen({super.key, required this.label});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  TextEditingController searchControll = TextEditingController();
  String selectedSubCat = "Sub1";
  @override
  void initState() {
    super.initState();
    searchControll.text = widget.label;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.blue,
      ),
      body: DefaultTabController(
        length: 2,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black26),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: TextField(
                  controller: searchControll,
                  decoration: InputDecoration(
                    hintStyle: const TextStyle(
                      height: 1.2,
                    ),
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 12, horizontal: 6),
                    prefixIcon: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    suffixIcon: const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.clear_rounded),
                        SizedBox(
                          width: 16,
                        ),
                        Icon(Icons.mic),
                        SizedBox(
                          width: 8,
                        )
                      ],
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 110,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  subcatMethod("Sub1"),
                  subcatMethod("Sub2"),
                  subcatMethod("Sub4"),
                  subcatMethod("Sub5"),
                  subcatMethod("Sub6"),
                  subcatMethod("Sub7"),
                  subcatMethod("Sub8"),
                ],
              ),
            ),

            TabBar(
              padding: const EdgeInsets.all(8),
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
                    'Shops',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
                Tab(
                  child: Text(
                    'Products',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 10,
            ),
            // Filter and Sort section
            const FilterRow(),
            const SizedBox(height: 16),
            SizedBox(
              height: MediaQuery.of(context).size.height * 1 - 167,
              child: TabBarView(children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      ...allShops.map((shop) => SpecialShopCard(shop: shop)),
                    ],
                  ),
                ),
                const SingleChildScrollView(
                  child: AllItemList(),
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }

  GestureDetector subcatMethod(String title) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedSubCat = title;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
        child: Column(
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: selectedSubCat == title
                        ? Colors.blue
                        : Colors.black.withOpacity(0.1),
                    blurRadius: 5,
                    spreadRadius: 1,
                  )
                ],
              ),
              child: Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRzKIWuHnXWNA-Ctp4wvgsvBKBVXP-SCHtHgQ&s",
                width: 70,
                height: 70,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: TextStyle(
                color: selectedSubCat == title ? Colors.blue : Colors.grey,
                fontWeight: selectedSubCat == title
                    ? FontWeight.bold
                    : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
