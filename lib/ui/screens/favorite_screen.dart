import 'package:flutter/material.dart';
import 'package:kmdha/utils/list_of_shops.dart';
import '../widgets/filter_row.dart';
import '../widgets/productscreen/special_shop.dart';
import '../widgets/shopscreen/all_items_list.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "FAVORITES",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const TabBar(
              dividerColor: Colors.transparent,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                color: Color.fromARGB(222, 255, 214, 64),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              tabs: [
                Tab(
                  child: Text(
                    "Shops",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Tab(
                  child: Text(
                    "Products",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ]),
          const SizedBox(
            height: 6,
          ),
          const FilterRow(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 1 - 270,
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
    );
  }
}
